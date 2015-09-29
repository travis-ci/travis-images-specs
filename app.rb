require 'sinatra/base'
require 'sinatra/param'
require 'sinatra/contrib'
require_relative 'suite_enqueuer'

class App < Sinatra::Base
  class << self
    def auth_tokens
      @auth_tokens ||= (ENV['AUTH_TOKENS'] || '').split(':').map(&:strip)
    end

    def base_env
      @base_env ||= Hash[ENV]
    end
  end

  unless development? || test?
    require 'rack/auth/basic'

    use Rack::Auth::Basic, 'Images Specs Realm' do |_, password|
      App.auth_tokens.include?(password)
    end

    require 'rack/ssl'

    use Rack::SSL
  end

  helpers Sinatra::Param

  post '/' do
    param :languages, Array, default: %w(ruby)

    results = SuiteEnqueuer.new(
      argv: params['languages'],
      env: App.base_env.merge(
        'OWNER' => params['owner'] || 'travis-ci',
        'REPO' => params['repo'] || 'travis-images-specs',
        'SPEC_BRANCH' => params['spec_branch'] || 'specs',
        'SKIP_INFRA' => params['skip_infra'] || '',
        'RSPEC_TAGS' => params['tags'] || ''
      ),
      requested_by: env['REMOTE_USER'] || 'gnomes'
    ).run

    halt 400 if results.empty?
    halt 500 if results.any? { |r| r.first >= 299 }

    status 201
    json data: results.map { |r| JSON.parse(r.last) }
  end

  run! if app_file == $PROGRAM_FILE
end
