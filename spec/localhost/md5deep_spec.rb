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
    its(:stdout) { should match 'cda48816cce93aabcc05b2412d9e87fc'}
  end
end
