require 'spec_helper'

describe 'memcached installation' do

  describe package('memcached') do
    it { should be_installed }
  end

end
