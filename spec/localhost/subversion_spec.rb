require 'spec_helper'

describe 'subversion installation' do
  describe command('svn --version') do
    its(:stdout) { should match 'svn, version 1.6.17' }
  end
end

describe 'subversion commands are executed' do
  describe command('svnadmin create svn-project; cat svn-project README.tx') do
    its(:stdout) { should match 'This is a Subversion repository; use the 'svnadmin' tool to examine/n
it.  Do not add, delete, or modify files here unless you know how/nto avoid corrupting the repository.' }
  end
end