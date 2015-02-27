require 'spec_helper'

describe 'phantomjs installation' do

  describe command('phantomjs -v') do
    its(:exit_status) { should eq 0 }
  end

  describe command ('phantomjs ./spec/files/phantomjs_test_google.js') do
    its(:stdout) { should match 'Status: success' }
  end

end
