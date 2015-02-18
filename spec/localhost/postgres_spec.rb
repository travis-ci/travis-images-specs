require 'spec_helper'

describe 'postgres installation' do

  describe package ('postgresql') do
    it { should be_installed }
  end

  describe command('createdb test; psql --list') do
    its(:stdout) { should match 'test' }
  end

end