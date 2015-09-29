describe 'riak installation', standard: true do
  describe package('riak') do
    it { should be_installed }
  end

  describe 'riak version' do
    before :all do
      system('riak version')
    end

    describe command('riak version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'riak commands', sudo: true do
    before do
      system('sudo riak start')
      sleep 5
    end

    describe command('sudo riak ping') do
      its(:stdout) { should match 'pong' }
    end

    describe command('sudo riak-admin test') do
      its(:stdout) { should match 'completed 1 read/write cycle' }
    end
  end
end
