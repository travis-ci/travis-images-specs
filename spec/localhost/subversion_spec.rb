require 'spec_helper'

describe 'subversion installation' do
  describe command('svn --version') do
    its(:stdout) { should match 'svn, version 1.6.17' }
  end
end

describe 'subversion commands are executed' do
  describe command('svnadmin create svn-project; cat svn-project README.txt') do
    its(:stdout) { should match 'This is a Subversion repository;' }
  end
end