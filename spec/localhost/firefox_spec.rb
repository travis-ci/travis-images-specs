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

    describe command('cat ~/.mozilla/firefox/profiles.ini') do
      its(:stdout) { should match 'Name=test' }
    end
  end

  describe 'firefox saves visit in database' do

    before do
      system('DISPLAY=:99.0 sh -e /etc/init.d/xvfb start')
      system('firefox --display=DISPLAY=:99.0 https://www.mozilla.org')
      system('SIGINT')
    end

    describe command('cd .mozilla/firefox/*.default; sqlite3 places.sqlite "SELECT * FROM moz_places;"') do
      its(:stdout) { should match 'www.mozilla.org' }
    end
  end
end
