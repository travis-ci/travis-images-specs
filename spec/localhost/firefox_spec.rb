require 'spec_helper'

describe 'firefox installation' do

  describe 'firefox version' do
    before :all do
      system('firefox -v')
    end

    describe command('firefox -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'firefox commands' do
    describe command('firefox -CreateProfile test --display=DISPLAY=:99.0') do
      its(:stdout) { should match 'Success' }
    end

    describe command('cat ~/.mozilla/firefox/profiles.ini') do
      its(:stdout) { should match 'Name=test' }
    end
  end

end
