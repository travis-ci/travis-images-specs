require 'spec_helper'

describe 'subversion installation' do
  describe 'subversion version' do
    before :all do
      system('svn --version | head -1')
    end

    describe command('svn --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'subversion commands are executed' do
    describe command('svnadmin create svn-project; cat svn-project/README.txt') do
      its(:stdout) { should match 'This is a Subversion repository;' }
    end
  end
end
