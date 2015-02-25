require 'spec_helper'

describe 'xserver installation' do

  describe package('xserver') do
    it { should be_installed }
  end

  describe package('xorg') do
    it { should be_installed }
  end

end
