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
  end
end
