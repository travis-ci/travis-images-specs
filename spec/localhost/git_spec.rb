require 'spec_helper'

describe 'git installation' do
  describe package('git') do
    it { should be_installed }
  end
end

describe 'git commands are executed' do
  before :all do
    system('git init test-project; sleep 3; cd test-project; sleep 3; touch test-file.txt')
  end

  describe command('cd test-project; git status') do
    its(:stdout) { should include('Untracked files:', 'test-file.txt') }
  end

  describe command('cd test-project; git add test-file.txt; git status') do
    its(:stdout) { should include('Changes to be committed:', 'new file:   test-file.txt') }
  end

   describe command('cd test-project; git add test-file.txt; git rm -f test-file.txt; git status') do
    its(:stdout) { should match 'nothing to commit' }
  end
end