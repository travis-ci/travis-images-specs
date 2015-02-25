require 'spec_helper'

describe 'networking_basic installation' do
  describe command('lsof -v') do
    its(:stdout) { should match 'lsof version information' }
  end

  describe command('iptables -version') do
    its(:stdout) { should match 'iptables v1.4.12' }
  end

  describe command('curl --version') do
    its(:stdout) { should match 'curl 7.22.0' }
  end

  describe command('wget -V') do
    its(:stdout) { should match 'GNU Wget 1.13.4 built on linux-gnu' }
  end

  describe command('rsync -v') do
    its(:stdout) { should match 'rsync  version 3.0.9  protocol version 30' }
  end

  describe command('netcat -v') do
    its(:stdout) { should match 'This is nc from the netcat-openbsd package.' }
  end

  describe command('ldconfig -p | grep libldap') do
    its(:stdout) { should match 'libldap_r-2.4.so.2' }
  end

  describe command('dpkg -s libldap2-dev') do
    its(:stdout) { should match 'Status: install ok installed' }
  end

  describe command('ldconfig -p | grep libcurl') do
    its(:stdout) { should match 'libcurl.so.4' }
  end
end
