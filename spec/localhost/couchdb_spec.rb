require 'spec_helper'

describe 'couchdb installation' do

  describe package('couchdb') do
    it { should be_installed }
  end

  describe 'couchdb commands', sudo: true do

    before :all do
      system('sudo service couchdb start')
      system('sleep 5')
    end

    describe command ('curl http://127.0.0.1:5984/') do
      its(:stdout) { should include 'couchdb Welcome' }
    end

  end

end
