require 'spec_helper'

describe 'mongodb installation' do

  describe 'mongo commands', sudo: true do

    describe command ('mongo --version')  do
      its(:stdout) { should match 'MongoDB shell version' }
    end

    before do
      system('sudo service mongodb start')
      system('sleep 10')
    end

    describe command ('cat /var/log/mongodb/mongodb.log')  do
      its(:stdout) { should match '[initandlisten] waiting for connections on port' }
    end

  end

end
