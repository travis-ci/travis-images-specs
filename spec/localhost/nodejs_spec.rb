require 'spec_helper'

describe 'nodejs installation' do
  describe command('node -v') do
    its(:stdout) { should match 'v0.10.36'}
  end

  describe command('node ./spec/files/node_server.js &') do
    its(:stdout) { should match 'Server running at http://0.0.0.0:8888/'}
  end
end
