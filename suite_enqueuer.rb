#!/usr/bin/env ruby

class SuiteEnqueuer
  SCRIPT = <<-EOF.split("\n").map(&:strip).reject(&:empty?)
    sh -e /etc/init.d/xvfb start || echo "ignoring exit $? from xvfb"

    : ${RSPEC_TAGS:=}
    : ${RSPEC_OPTS:=}

    if ! sudo -n true 2>/dev/null ; then RSPEC_TAGS="${RSPEC_TAGS} ~sudo" ; fi

    for tag in ${RSPEC_TAGS} ; do RSPEC_OPTS="${RSPEC_OPTS} --tag ${tag}" ; done

    export RSPEC_OPTS

    bundle exec rake
  EOF

  def self.run(argv: ARGV)
    new(argv: argv).run
  end

  def initialize(argv: ARGV, env: ENV, requested_by: nil)
    @argv = argv
    @env = env
    @requested_by = requested_by
  end

  def run
    load_reqs

    unless env['TRAVIS_TOKEN']
      puts 'Env var TRAVIS_TOKEN not set'
      return []
    end

    configure

    responses = []

    languages.map(&:strip).compact.each do |lang|
      next if lang.empty?

      config = {
        language: lang,
        matrix: { include: build_configs(lang) },
        env: { global: %w(DISPLAY=:99.0 DEBIAN_FRONTEND=noninteractive) },
        install: 'bundle install --jobs=3 --retry=3',
        script: SCRIPT
      }

      puts "Enqueueing suite for config=#{config.inspect}"

      response = enqueue(config)

      responses << [response.status.to_i, response.body]
    end

    responses
  end

  private

  attr_reader :env, :argv, :token, :languages, :travis_api, :owner, :tags
  attr_reader :requested_by, :spec_branch, :repo, :now, :whom, :skip_infra

  def load_reqs
    require 'etc'
    require 'excon'
    require 'faraday'
    require 'json'
  end

  def configure
    @token = env.fetch('TRAVIS_TOKEN')
    @tags = env_array('RSPEC_TAGS')
    @languages = (env_array('LANGUAGE_SUITES') + argv).compact
    @travis_api = env['TRAVIS_API_ENDPOINT'] || 'https://api.travis-ci.org'
    @owner = env['OWNER'] || 'travis-infrastructure'
    @spec_branch = env['SPEC_BRANCH'] || 'specs'
    @repo = env['REPO'] || 'packer-templates'
    @now = Time.now.utc
    @whom = requested_by || env['USER'] || Etc.getpwuid(Process.euid).name
    @skip_infra = env_array('SKIP_INFRA')
  end

  def conn
    @conn ||= Faraday.new(url: travis_api) do |faraday|
      faraday.response :logger if env['DEBUG']
      faraday.adapter :excon
    end
  end

  def env_array(key)
    %W(#{env[key]}).map { |t| t.split(',') }.flatten.compact
  end

  def array_comma_join(arr)
    arr.flatten.compact.join(',').sub(/,$/, '')
  end

  def build_configs(lang)
    [].tap do |c|
      c << {
        sudo: false,
        env: "RSPEC_TAGS=#{array_comma_join(tags + %w(standard))}"
      } unless skip_infra.include?('docker')
      c << {
        sudo: 'required',
        env: "RSPEC_TAGS=#{array_comma_join(tags + %w(standard))}"
      } unless skip_infra.include?('linux')

      gce_tag = lang == 'generic' ? 'minimal' : 'mega'
      c << {
        sudo: 'required',
        services: 'docker',
        group: 'edge',
        env: "RSPEC_TAGS=#{array_comma_join(tags + [gce_tag])}"
      } unless skip_infra.include?('gce')
    end
  end

  def enqueue(config)
    conn.post do |req|
      req.url "/repo/#{owner}%2F#{repo}/requests"
      req.headers['Content-Type'] = 'application/json'
      req.headers['Travis-API-Version'] = '3'
      req.headers['Authorization'] = "token #{token}"
      req.body = body_for_config(config).to_json
    end
  end

  def body_for_config(config)
    {
      request: {
        config: config,
        message: %W(
          lang=#{config[:language].inspect}
          date=#{now.to_s.inspect}
          whom=#{whom.inspect}
        ).join(' '),
        repository: {
          owner_name: owner,
          branch: spec_branch,
          name: repo
        }
      }
    }
  end
end
