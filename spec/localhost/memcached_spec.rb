require 'spec_helper'

describe 'memcached installation' do

  describe package('memcached') do
    it { should be_installed }
  end

  describe 'memcached commands', sudo: true do

    before :all do
      system('sudo service memcached start')
      system('sleep 5')
    end

    describe service('memcached') do
      it { should be_running }
    end

    describe command ('echo \'stats\' | nc 127.0.0.1 11211')  do
      its(:stdout) { should match 'version' }
    end
  end

end