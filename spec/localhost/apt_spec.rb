describe 'apt installation', mega: true, standard: true, minimal: true do
  describe 'apt version' do
    before :all do
      system('apt-get -v | head -1')
    end
  end

  describe 'apt commands', sudo: true do
    describe command('sudo apt-get update') do
      its(:stdout) { should match 'Reading package lists...' }
    end

    describe command('sudo apt-get install default-jdk') do
      its(:stdout) { should match 'Setting up default-jdk' }
    end
  end
end
