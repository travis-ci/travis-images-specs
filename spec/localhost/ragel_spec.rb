require 'spec_helper'

describe 'ragel installation' do

  describe package('ragel') do
    it { should be_installed }
  end

  describe command('ragel -v') do
    its(:exit_status) { should eq 0 }
  end

end

