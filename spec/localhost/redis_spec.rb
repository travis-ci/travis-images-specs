describe 'redis installation', mega: true, standard: true do
  describe command ('redis-server --version') do
    its(:stdout) { should match(/^Redis /) }
    its(:exit_status) { should eq 0 }
  end

  describe 'redis commands' do
    before :all do
      system('redis-server &', [:out, :err] => '/dev/null')
      tcpwait('localhost', 6379)
    end

    before :each do
      system('redis-cli SET test_key test_value', [:out, :err] => '/dev/null')
    end

    describe command ('redis-cli PING') do
      its(:stdout) { should match(/^PONG$/) }
    end

    describe command ('redis-cli GET test_key | cat') do
      its(:stdout) { should match(/^test_value$/) }
    end
  end
end
