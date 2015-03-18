require 'spec_helper'

describe 'sphinx installation' do

  describe 'sphinx version' do
    before :all do
      system('searchd | grep Sphinx | head -1')
    end

    describe command('searchd') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe command('/usr/local/sphinx-2.2.6/bin/indexer') do
    its(:stdout) { should match 'Sphinx 2.2.6-id64-release' }
  end

  describe command('/usr/local/sphinx-2.1.9/bin/indexer') do
    its(:stdout) { should match 'Sphinx 2.1.9-release' }
  end

  describe command('/usr/local/sphinx-2.0.10/bin/indexer') do
    its(:stdout) { should match 'Sphinx 2.0.10-release' }
  end
end
