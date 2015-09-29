describe 'redis installation', mega: true, standard: true do
  describe 'redis version' do
    before :all do
      system('redis-server --version')
    end

    describe command ('redis-server --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'redis commands' do
    before :all do
      system('redis-server &')
    end

    describe command ('redis-cli ping') do
      its(:stdout) { should match 'PONG' }
    end

    describe command ('redis-cli set key test_key; redis-cli get key') do
      its(:stdout) { should match 'test_key' }
    end
  end
end
