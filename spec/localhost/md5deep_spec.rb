require 'spec_helper'

describe 'md5deep installation' do

  describe 'md5deep version' do
    before :all do
      system('md5deep -v')
    end

    describe command('md5deep -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'md5deep commands' do
    describe command('md5deep -V') do
      its(:stdout) { should match 'This program is a work of the US Government.' }
    end

    describe command('md5deep ./spec/files/md5deep.txt') do
      its(:stdout) { should match '29c04665afa6ef18edc38824ceaff6ab'}
    end
  end

end
