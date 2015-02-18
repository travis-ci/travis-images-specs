require 'spec_helper'

describe 'riak installation' do

  describe package('riak') do
    it { should be_installed }
  end

  # riak can only be tested using sudo

  # before :all do
  #   system('riak start')
  # end

  # describe command('riak ping') do
  #   its(:stdout) { should match 'pong' }
  # end

end