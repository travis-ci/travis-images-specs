require 'spec_helper'

describe 'mercurial installation' do
  describe command('hg version') do
    its(:stdout) { should match 'Mercurial Distributed SCM \(version 2.0.2\)' }
  end
end

describe 'mecurial commands are executed' do
  before do
    system('hg init test-project; sleep 3; cd test-project; sleep 3; touch test-file.txt')
  end

  describe command('cd test-project; hg status') do
    its(:stdout) { should match '\? test-file.txt' }
  end

  describe command('cd test-project; hg add .; hg status') do
    its(:stdout) { should match 'A test-file.txt' }
  end

   describe command('cd test-project; hg add .; hg forget test-file.txt; hg status') do
    its(:stdout) { should match '\? test-file.txt' }
  end
end