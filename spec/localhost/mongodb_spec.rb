require 'spec_helper'

describe 'mongodb installation' do

  describe package('mongo') do
    it { should be_installed }
  end


end
