describe 'memcached installation', mega: true, standard: true do
  describe package('memcached') do
    it { should be_installed }
  end

  describe 'memcached version' do
    before :all do
      system('memcached -h | head -1')
    end

    describe command('memcached -h | head -1') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'memcached commands', sudo: true do
    before :all do
      system('sudo service memcached start')
      system('sleep 5')
    end

    describe service('memcached') do
      it { should be_running }
    end

    describe command ('echo \'stats\' | nc 127.0.0.1 11211') do
      its(:stdout) { should match 'version' }
    end
  end
end
