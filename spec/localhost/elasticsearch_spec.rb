require 'spec_helper'

describe 'elasticsearch installation' do

  describe package('elasticsearch') do
    it { should be_installed }
  end
end


