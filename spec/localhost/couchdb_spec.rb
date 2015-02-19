require 'spec_helper'

describe 'couchdb installation' do

  describe package('couchdb') do
    it { should be_installed }
  end

end
