require 'spec_helper'

describe 'neo4j installation' do

  describe package('neo4j') do
    it { should be_installed }
  end

  describe 'neo4j commands', sudo: true do

    before :all do
      system('sudo neo4j start')
      system('sleep 10')
    end

    describe service('neo4j-shell -c') do
      it { should be_running }
    end

    describe command ('neo4j-shell -c "set -t int height 178"; neo4j-shell -c "ls"') do
      its(:stdout) { should match '*height =[178]'}
    end
  end

end