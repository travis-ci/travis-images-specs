require 'spec_helper'

describe 'maven installation' do
  describe 'maven version' do
    before :all do
      system('mvn -version | head -1')
    end

    describe command('mvn -version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'maven commands' do
    describe command('mvn help:describe -Dplugin=help; sleep 5') do
      its(:stdout) { should match 'Name: Maven Help Plugin' }
    end
  end
end
