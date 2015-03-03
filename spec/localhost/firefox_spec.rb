require 'spec_helper'

describe 'firefox installation' do

  describe command('firefox -v') do
    its(:exist_status) { should eq 0 }
  end

  describe 'firefox start' do

    before :all do
      system('DISPLAY=:99.0 sh -e /etc/init.d/xvfb start')
      system('sleep 5')
    end

    describe command('firefox -CreateProfile test --display=DISPLAY=:99.0') do
      its(:stdout) { should match 'Success' }
    end

    describe command('cat ~/.mozilla/firefox/profiles.ini') do
      its(:stdout) { should match 'Name=test' }
    end
  end

end
