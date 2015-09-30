describe 'apt installation', mega: true, standard: true, minimal: true do
  describe command('apt-get -v') do
    its(:exit_status) { should eq 0 }
  end

  describe 'apt commands', sudo: true do
    describe command('sudo apt-get -y update') do
      its(:stdout) { should match(/Reading package lists/) }
    end

    describe command('sudo apt-get -y install language-pack-ar-base') do
      its(:stdout) { should match(/Setting up /) }
    end
  end
end
