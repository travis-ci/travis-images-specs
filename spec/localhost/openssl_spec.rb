require 'spec_helper'

describe 'openssl installation' do
  describe command('openssl version') do
    its(:stdout) { should match 'OpenSSL 1.0.1 14 Mar 2012' }
  end
end

describe 'openssl commands are executed' do
  describe command('echo "Konstantin broke all the things." | openssl enc -base64') do
    its(:stdout) { should match 'S29uc3RhbnRpbiBicm9rZSBhbGwgdGhlIHRoaW5ncy4K' }
  end

  describe command('echo "S29uc3RhbnRpbiBicm9rZSBhbGwgdGhlIHRoaW5ncy4K" | openssl enc -base64 -d') do
    its(:stdout) { should match 'Konstantin broke all the things.' }
  end
end