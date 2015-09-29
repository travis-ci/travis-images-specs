describe 'sysctl installation', mega: true, standard: true, minimal: true do
  describe 'sysctl version' do
    before :all do
      system('sysctl -V | head -1')
    end

    describe command('sysctl -V') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'sysctl commands are executed' do
    describe command('sysctl -a; sleep 5') do
      its(:stdout) { should include('kernel.sched_child_runs_first') }
    end
  end
end
