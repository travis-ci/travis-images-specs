require 'spec_helper'

describe 'maven installation' do
  describe command('mvm version') do
    its(:stdout) { should match 'Apache Maven 3.2.5' }
  end

  describe 'mvn command is executed' do

    describe command('mvn help:describe -Dplugin=help; sleep 5') do
      its(:stdout) { should match 'Name: Maven Help Plugin' }
    end
  end
end
