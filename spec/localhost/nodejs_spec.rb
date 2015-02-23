require 'spec_helper'

describe 'nodejs installation ' do

  describe command('node -v') do
    its(:stdout) { should match 'v0.10.36'}
  end

  describe command('node ./spec/files/node_server.js') do
    its(:stdout) { should match 'Server running at http://127.0.0.1:1337/'}
  end

  describe command('node .spec/files/node_http.js; curl localhost:8080') do
    its (:stdout) { should match 'Hello Http'}
  end
end
