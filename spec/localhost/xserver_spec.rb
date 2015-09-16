require 'spec_helper'

describe 'xserver installation' do
  describe 'xserver version' do
    before :all do
      system('Xorg -version 2>&1 | grep --color=never X.Org')
    end

    describe command('Xorg -version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'xserver starts' do
    describe 'virtual server' do
      describe command('DISPLAY=:99.0 xset -q') do
        # xset -q tests if X server is reachable
        its(:exit_status) { should eq 0 }
      end
    end
  end
end
