require 'spec_helper'

describe 'ragel installation' do
  describe package('ragel') do
    it { should be_installed }
  end

  describe 'ragel version' do
    before :all do
      system('ragel -v | head -1')
    end

    describe command('ragel -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'ragel commands' do
    describe 'add a ragel file and execute a ragel command' do
      before do
        system('echo "puts \"Hello World\"" > ./spec/files/hello_world.rl')
        system('ragel -R ./spec/files/hello_world.rl')
      end

      describe command('cat ./spec/files/hello_world.rb') do
        its(:stdout) { should match 'puts "Hello World"' }
      end
    end
  end
end
