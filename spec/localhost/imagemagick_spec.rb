require 'spec_helper'

describe 'imagemagick installation' do

  describe 'imagemagick version' do
    before :all do
      system('convert --version | head -1')
    end

    describe command('convert --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'imagemagick commands' do
    before do
      system('convert logo: logo.gif')
    end

    describe command('identify logo.gif') do
      its(:exit_status) { should eq 0 }
    end
  end

end
