require 'spec_helper'

describe 'dictionaries installation' do
  describe package('wamerican') do
    it { should be_installed }
  end
end
