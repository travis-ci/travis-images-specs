require 'spec_helper'

describe 'memcached installation' do

  describe package('memcached') do
    it { should be_installed }
  end

  describe command ('echo \"stats\" | nc 127.0.0.1 11211')  do
    its(:stdout) { should match 'STAT version' }
  end

end
