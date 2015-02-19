require 'spec_helper'

describe 'mongodb installation' do

  describe package('mongodb') do
    it { should be_installed }
  end


end
