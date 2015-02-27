require 'spec_helper'

describe 'unarchivers installation' do
  describe command('gzip --version') do
    its(:stdout) { should match 'gzip 1.4' }
  end

  describe command('bzip2 --version') do
    its(:stdout) { should match 'bzip2, a block-sorting file compressor.' }
  end

  describe command('zip --version') do
    its(:stdout) { should match 'This is Zip 3.0' }
  end

  describe command('unzip -version') do
    its(:stdout) { should match 'UnZip 6.00 of 20 April 2009' }
  end

  describe command('dpkg -s libbz2-dev') do
    its(:stdout) { should match 'Status: install ok installed' }
  end
end
