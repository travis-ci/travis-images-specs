require 'spec_helper'

describe 'firefox installation' do

  describe package('elasticsearch') do
    it { should be_installed }
  end

  describe 'firefox start' do

    before :all do
      system('DISPLAY=:99.0 sh -e /etc/init.d/xvfb start')
      system('sleep 5')
    end

    describe command('firefox -CreateProfile test --display=DISPLAY=:99.0') do
      its(:stdout) { should match 'Success' }
    end

  end
end
