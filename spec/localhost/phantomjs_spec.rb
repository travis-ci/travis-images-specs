require 'spec_helper'

describe 'phantomjs installation' do

  describe 'phantomjs version' do
    before :all do
      system('phantomjs -v')
    end

    describe command('phantomjs -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'phantomjs commands' do
    describe command ('phantomjs ./spec/files/phantomjs_test_google.js') do
      its(:stdout) { should match 'Status: success' }
    end
  end

end
