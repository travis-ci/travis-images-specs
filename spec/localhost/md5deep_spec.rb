require 'spec_helper'

describe 'md5deep installation' do
  describe command('md5deep -v') do
    its(:stdout) { should match '3.9.2' }
  end

  describe command('md5deep -V') do
    its(:stdout) { should match 'This program is a work of the US Government.' }
  end
end

describe 'm5deep commands' do
  describe command('md5deep ./spec/files/md5deep.txt') do
    its(:stdout) { should match '29c04665afa6ef18edc38824ceaff6ab'}
  end
end
