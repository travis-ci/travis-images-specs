require 'spec_helper'

describe 'phantomjs installation' do

  describe package('phantomjs') do
    it { should be_installed }
  end

end
