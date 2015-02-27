require 'spec_helper'

describe 'chromium installation' do

  describe package('chromium-browser') do
    it { should be_installed }
  end

  describe 'chromium start' do
  end
end


