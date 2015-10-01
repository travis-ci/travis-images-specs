describe 'networking_basic installation', mega: true, standard: true do
  describe command('lsof -v 2>&1 | head -2 | tail -1') do
    its(:stdout) { should match(/revision:/) }
    its(:exit_status) { should eq 0 }
  end

  describe command('iptables --version') do
    its(:stdout) { should include 'iptables' }
    its(:exit_status) { should eq 0 }
  end

  describe command('curl --version | head -1') do
    its(:stdout) { should include 'curl' }
    its(:exit_status) { should eq 0 }
  end

  describe command('wget --version') do
    its(:stdout) { should include 'GNU Wget' }
    its(:exit_status) { should eq 0 }
  end

  describe command('rsync --version') do
    its(:stdout) { should match(/rsync.+version/) }
    its(:exit_status) { should eq 0 }
  end

  describe command('nc -h') do
    its(:stderr) { should match(/OpenBSD netcat/) }
    its(:exit_status) { should eq 0 }
  end

  describe command('nc -zv 127.0.0.1 22') do
    its(:stderr) { should include 'succeeded' }
  end

  describe command('ldconfig -V') do
    its(:stdout) { should include 'ldconfig ' }
    its(:exit_status) { should eq 0 }
  end

  describe command('ldconfig -p | grep libldap') do
    its(:stdout) { should match(/libldap_r/) }
    its(:exit_status) { should eq 0 }
  end
end
