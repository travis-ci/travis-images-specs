require 'spec_helper'

describe 'chromium installation' do

  describe package('chromium-browser') do
    it { should be_installed }
  end

  describe command('chromium-browser --version') do
    its(:stdout) { should match 'Chromium' }
  end

end
