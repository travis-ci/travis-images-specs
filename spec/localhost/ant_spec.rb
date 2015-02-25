require 'spec_helper'

describe 'ant installation' do
  describe command('ant -version') do
    its(:stdout) { should match 'Apache Ant(TM) version' }
  end

  describe 'ant command is executed' do
    describe command('ant -diagnostics') do
      its(:stdout) { should include('------- Ant diagnostics report -------', 'ANT PROPERTIES', 'System Properties') }
    end

    describe command('ant &') do
      its(:stdout) { should match 'Buildfile: build.xml does not exist! Build failed' }
    end
  end
end
