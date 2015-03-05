require 'spec_helper'

describe 'xserver installation' do

  describe 'xserver version' do
    describe command('Xorg -version') do
      its(:stdout) { should match 'X.Org X Server 1.11.3' }
    end
  end

  describe 'starting virtual server' do
    before do
      system('DISPLAY=:99.0 sh -e /etc/init.d/xvfb start')
      system('sleep 15')
    end

    describe command('DISPLAY=:99.0 xset -q') do
      #xset -q tests if X server is reachable
      its(:exit_status) { should eq 0 }
    end
  end

end
