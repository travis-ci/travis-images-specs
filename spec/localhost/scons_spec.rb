require 'spec_helper'

describe 'scons installation' do
  describe command('scons -v') do
    its(:stdout) { should match 'SCons by Steven Knight et al.:' }
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
end