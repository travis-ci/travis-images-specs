require 'spec_helper'

describe 'scons installation' do

  describe 'scons version' do
    before :all do
      system('scons -v | grep --color=never script')
    end

    describe command('scons -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'scons commands are executed' do
    describe command('scons -C ./spec/files; sleep 5') do
      its(:stdout) { should include('scons: Reading SConscript files',
                                    'scons: Building targets',
                                    'gcc -o helloworld.o -c helloworld.c',
                                    'gcc -o helloworld helloworld.o',
                                    'scons: done building targets.') }
    end

    describe command('cd ./spec/files; scons --tree=all; sleep 5') do
      its(:stdout) { should include('+-SConstruct',
                                    '+-helloworld',
                                    '+-helloworld.o',
                                    '+-helloworld.c',
                                    '+-/usr/bin/gcc',
                                    'scons: done building targets.') }
    end
  end
end
