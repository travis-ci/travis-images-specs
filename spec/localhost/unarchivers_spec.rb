require 'spec_helper'

describe 'unarchivers installation' do
  describe 'gzip version' do
    before :all do
      system('gzip -version')
    end

    describe command('gzip --version') do
      its(:exit_status) { should eq 0 }
    end
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

describe 'unarchivers commands' do
  describe command('gzip ./spec/files/unarchivers.txt; ls ./spec/files/') do
    its(:stdout) { should include('unarchivers.txt.gz') }
  end

  describe command('gzip -d ./spec/files/unarchivers.txt.gz; cat ./spec/files/unarchivers.txt') do
    its(:stdout) { should match 'Konstantin broke all the things.' }
  end

  describe command('bzip2 -z ./spec/files/unarchivers.txt; ls ./spec/files/') do
    its(:stdout) { should include('unarchivers.txt.bz2') }
  end

  describe command('bzip2 -d ./spec/files/unarchivers.txt.bz2; cat ./spec/files/unarchivers.txt') do
    its(:stdout) { should match 'Konstantin broke all the things.' }
  end

  describe command('zip ./spec/files/unarchivers.txt.zip ./spec/files/unarchivers.txt; ls ./spec/files') do
    its(:stdout) { should include('unarchivers.txt.zip') }
  end

  describe command('unzip ./spec/files/unarchivers2.txt.zip; sleep 2; cat unarchivers2.txt') do
    its(:stdout) { should match 'Konstantin broke all the things' }
  end
end
