require 'spec_helper'

describe 'xserver installation' do

  describe 'xserver version' do
    before :all do
      system('Xorg -version')
    end

    describe command('Xorg -version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'starting virtual server' do
    describe command('DISPLAY=:99.0 xset -q') do
      #xset -q tests if X server is reachable
      its(:exit_status) { should eq 0 }
    end
  end

end
