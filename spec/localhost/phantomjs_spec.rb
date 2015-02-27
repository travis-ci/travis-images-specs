require 'spec_helper'

describe 'phantomjs installation' do

  describe package('phantomjs') do
    it { should be_installed }
  end

  describe command ('phantomjs ./spec/files/phantomjs_test_google.js') do
    its(:stdout) { should match 'Status: success' }
  end

end
