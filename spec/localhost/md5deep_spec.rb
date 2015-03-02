require 'spec_helper'

describe 'md5deep installation' do
  describe command('md5deep -v') do
    its(:stdout) { should match '3.9.2' }
  end

  describe command('md5deep -V') do
    its(:stdout) { should match 'This program is a work of the US Government.' }
  end
end
