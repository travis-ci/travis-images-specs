require 'spec_helper'

describe 'mongodb installation' do

  describe command ('mongo --version')  do
    its(:stdout) { should match 'MongoDB shell version' }
  end

  describe 'mongo commands', sudo: true do

    before :all do
      system('sudo service mongodb start')
      system('sleep 10')
    end

    describe command ('cat /var/log/mongodb/mongodb.log')  do
      its(:stdout) { should match '[initandlisten] waiting for connections on port' }
    end

    describe command ('mongo --eval "db.testData.insert( { x : 6 } ); db.getCollectionNames()"')  do
      its(:stdout) { should match 'testData' }
    end
  end

end
