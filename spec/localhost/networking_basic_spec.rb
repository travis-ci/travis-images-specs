require 'spec_helper'

describe 'networking_basic installation' do
  describe 'lsof version' do
    before :all do
      system('lsof -v 2>&1 | head -2 | tail -1')
    end

    describe command('lsof -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'iptables version' do
    before :all do
      system('iptables --version')
    end

    describe command('iptables --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'curl version' do
    before :all do
      system('curl --version')
    end

    describe command('curl --version | head -1') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'wget version' do
    before :all do
      system('wget --version | head -1')
    end

    describe command('wget --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'rsync version' do
    before :all do
      system('rsync --version | head -1')
    end

    describe command('rsync --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'netcat version' do
    before :all do
      system('netcat -h 2>&1 | head -1')
    end

    describe command('netcat -h') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'netcat command' do
    describe command('nc -zv localhost 22-25') do
      its(:stdout) { should include('succeeded') }
    end
  end

  describe 'ldconfig version' do
    before :all do
      system('ldconfig -V | head -1')
    end

    describe command('ldconfig -V') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'ldconfig command' do
    describe command('ldconfig -p | grep libldap') do
      its(:stdout) { should match 'libldap_r-2.4.so.2' }
    end
  end

  describe 'libldap2-dev version' do
    before :all do
      system('dpkg -s libldap2-dev | head -10 | tail -1')
    end
  end

  describe 'libldap2-dev command' do
    describe command('dpkg -s libldap2-dev') do
      its(:stdout) { should match 'Status: install ok installed' }
    end
  end

  describe 'libcurl version' do
    before :all do
      system('curl-config --version')
    end

    describe command('curl-config --version') do
      its(:exit_status) { should eq 0 }
    end
  end
end
