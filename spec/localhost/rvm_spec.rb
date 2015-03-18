require 'spec_helper'

describe 'rvm installation' do

  describe 'rvm version' do
    before :all do
      system('rvm version')
    end

    describe command('rvm version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe command('rvm list') do
    its(:stdout) { should include('rvm rubies', 'current') }
  end
end
