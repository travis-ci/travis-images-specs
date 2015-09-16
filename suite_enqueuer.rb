#!/usr/bin/env ruby

class SuiteEnqueuer
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
        matrix: { include: build_configs },
        install: 'bundle install --jobs=3 --retry=3',
        script: 'bin/run-suite'
      }

      puts "Enqueueing suite for config=#{config.inspect}"

      response = enqueue(config)

      responses << [response.status.to_i, response.body]
    end

    responses
  end

  private

  attr_reader :env, :argv, :token, :languages, :travis_api, :owner
  attr_reader :requested_by, :spec_branch, :repo, :now, :whom, :skip_infra

  def load_reqs
    require 'etc'
    require 'excon'
    require 'faraday'
    require 'json'
  end

  def configure
    @token = env.fetch('TRAVIS_TOKEN')
    @languages = (%W(#{env['LANGUAGE_SUITES']}) + argv).compact
    @travis_api = env['TRAVIS_API_ENDPOINT'] || 'https://api.travis-ci.org'
    @owner = env['OWNER'] || 'travis-ci'
    @spec_branch = env['SPEC_BRANCH'] || 'specs'
    @repo = env['REPO'] || 'travis-images-specs'
    @now = Time.now.utc
    @whom = requested_by || env['USER'] || Etc.getpwuid(Process.euid).name
    @skip_infra = %W(#{env['SKIP_INFRA']})
  end

  def conn
    @conn ||= Faraday.new(url: travis_api) do |faraday|
      faraday.response :logger if env['DEBUG']
      faraday.adapter :excon
    end
  end

  def build_configs
    @build_configs ||= [].tap do |c|
      c << { sudo: false } unless skip_infra.include?('docker')
      c << { sudo: 'required' } unless skip_infra.include?('linux')
      c << {
        sudo: 'required',
        services: 'docker',
        group: 'edge'
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
