require 'spec_helper'

describe 'redis installation' do

  before :all do
    system('redis-server &')
  end

  describe command ('redis-cli ping') do
    its(:stdout) { should match 'PONG' }
  end

  describe command ('redis-cli set key test_key; redis-cli get key') do
    its(:stdout) { should match 'test_key' }
  end

end