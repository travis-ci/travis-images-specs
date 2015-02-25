require 'spec_helper'

describe 'ant installation' do
  describe command('ant -version') do
    its(:stdout) { should match 'Apache' }
  end

  describe 'ant command is executed' do
    describe command('ant -diagnostics; sleep 5') do
      its(:stdout) { should include('Ant diagnostics report') }
    end

    describe command('ant &') do
      its(:stdout) { should match 'Buildfile: build.xml does not exist!\nBuild failed' }
    end
  end
end
