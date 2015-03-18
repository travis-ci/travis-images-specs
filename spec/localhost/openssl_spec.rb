require 'spec_helper'

describe 'openssl installation' do

  describe 'openssl version' do
    system('openssl version')

    describe command('openssl version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'openssl commands' do
    describe command('echo "Konstantin broke all the things." | openssl enc -base64') do
      its(:stdout) { should match 'S29uc3RhbnRpbiBicm9rZSBhbGwgdGhlIHRoaW5ncy4K' }
    end

    describe command('echo "S29uc3RhbnRpbiBicm9rZSBhbGwgdGhlIHRoaW5ncy4K" | openssl enc -base64 -d') do
      its(:stdout) { should match 'Konstantin broke all the things.' }
    end
  end

end

