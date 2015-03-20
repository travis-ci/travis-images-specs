require 'spec_helper'

describe 'git installation' do
  describe package('git') do
    it { should be_installed }
  end

  describe 'git version' do
    before :all do
      system('git --version')
    end

    describe command('git --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'git commands are executed' do
    before :all do
      system('git init git-project; sleep 3; cd git-project; sleep 3; touch test-file.txt')
    end

    describe command('cd git-project; git status') do
      its(:stdout) { should include('Untracked files:', 'test-file.txt') }
    end

    describe command('cd git-project; git add test-file.txt; git status') do
      its(:stdout) { should include('Changes to be committed:', 'new file:   test-file.txt') }
    end

     describe command('cd git-project; git add test-file.txt; git rm -f test-file.txt; git status') do
      its(:stdout) { should match 'nothing to commit' }
    end
  end

end
