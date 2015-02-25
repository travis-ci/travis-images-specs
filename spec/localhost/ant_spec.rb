require 'spec_helper'

describe 'ant installation' do
  describe command('ant -version') do
    its(:stdout) { should match 'Apache Ant(TM) version 1.8.2 compiled on December 3 2011\n' }
  end

  describe 'ant command is executed' do
    describe command('ant -diagnostics; sleep 5') do
      its(:stdout) { should include('Ant diagnostics report', 'ANT PROPERTIES', 'System Properties') }
    end

    describe command('ant &') do
      its(:stdout) { should match 'Buildfile: build.xml does not exist!\nBuild failed' }
    end
  end
end
