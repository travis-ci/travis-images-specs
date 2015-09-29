describe 'rvm installation', mega: true, standard: true, minimal: true do
  describe 'rvm version' do
    before :all do
      system('rvm version')
    end

    describe command('rvm version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'rvm commands' do
    describe command('rvm list') do
      its(:stdout) { should include('rvm rubies', 'current') }
    end
  end
end
