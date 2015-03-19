require 'spec_helper'

describe 'mercurial installation' do

  describe 'mercurial version' do
    before :all do
      system('hg version | head -1')
    end

    describe command('hg version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'mecurial commands are executed' do
    before :all do
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

end
