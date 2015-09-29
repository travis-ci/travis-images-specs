describe 'gimme installation', mega: true, standard: true, minimal: true do
  describe 'gimme version' do
    before :all do
      system('gimme --version')
    end

    describe command('gimme --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'gimme commands' do
    describe command('gimme --list;') do
      its(:stdout) { should match '1.4.1 \<\= current' }
    end

    describe command('eval "$(gimme 1.3)"; sleep 5; go version') do
      its(:stdout) { should match 'go version go1.3 linux/amd64' }
    end
  end
end
