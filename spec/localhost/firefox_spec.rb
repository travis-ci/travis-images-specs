require 'spec_helper'

describe 'firefox installation' do

  describe package('elasticsearch') do
    it { should be_installed }
  end
end
