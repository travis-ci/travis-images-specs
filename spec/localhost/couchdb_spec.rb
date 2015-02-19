require 'spec_helper'

describe 'couchdb installation' do

  describe package('couchdb') do
    it { should be_installed }
  end

  describe 'couchdb commands', sudo: true do

    before :all do
      system('sudo service couchdb start')
      system('sleep 5')
      system('curl -X PUT http://127.0.0.1:5984/baseball')
    end

    describe command ('curl http://127.0.0.1:5984/') do
      its(:stdout) { should contain 'couchdb Welcome' }
    end

    describe command ('curl -X GET http://127.0.0.1:5984/_all_dbs') do
      its(:stdout) { should match 'baseball' }
    end

  end

end
