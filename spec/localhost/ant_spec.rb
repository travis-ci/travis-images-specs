require 'spec_helper'

describe 'ant installation' do

  describe 'ant version' do
    before :all do
      system('ant -version')
    end

    describe command('ant -version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'ant command' do
    describe command('ant -diagnostics; sleep 5') do
      its(:stdout) { should include('Ant diagnostics report') }
    end

    describe command('ant &') do
      its(:stdout) { should match 'Buildfile: build.xml does not exist!\nBuild failed' }
    end
  end

end
