require 'spec_helper'

describe 'rvm installation' do
  describe command('rvm version') do
    its(:stdout) { should match 'rvm' }
  end

  describe command('rvm list') do
    its(:stdout) { should include('rvm rubies', 'current') }
  end

  describe 'rvm command is executed' do
    system('echo rvm list')
    describe command('rvm use 2.1.2; sleep 5; rvm info') do
      its(:stdout) { should match 'ruby-2.1.2' }
    end
  end
end
