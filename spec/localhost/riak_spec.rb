require 'spec_helper'

describe 'riak installation' do

  describe package('riak') do
    it { should be_installed }
  end

  describe 'riak commands', sudo: true do
  # riak commands can only be tested using sudo

    before :all do
      system('sudo riak start')
    end

    describe command('sudo riak ping') do
      its(:stdout) { should match 'pong' }
    end

    describe command ('sudo riak-admin test') do
      its(:stdout) { should match 'completed 1 read/write cycle' }
    end
  end
end
