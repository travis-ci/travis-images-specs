require 'spec_helper'

describe 'riak installation' do

  before :all do
    system('riak start')
  end

  describe command('riak ping') do
    its(:stdout) { should match 'pong' }
  end

end