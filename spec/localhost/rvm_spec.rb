describe 'rvm installation', mega: true, standard: true, minimal: true do
  describe command('rvm version') do
    its(:stdout) { should match(/^rvm /) }
    its(:exit_status) { should eq 0 }
  end

  describe file('/usr/local/rvm/user/db'), standard: :todo do
    it { should exist }
    it { should be_writable }
    it { should be_readable }
  end

  describe 'rvm commands' do
    describe command('rvm list') do
      its(:stdout) { should include('rvm rubies', 'current') }
    end
  end
end
