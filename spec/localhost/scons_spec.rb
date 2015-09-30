describe 'scons installation', mega: true, standard: true do
  describe command('scons -v') do
    its(:stdout) { should match(/v\d/) }
    its(:exit_status) { should eq 0 }
  end

  describe 'scons commands' do
    describe command('scons -C ./spec/files') do
      its(:stdout) do
        should include('scons: Reading SConscript files',
                       'scons: Building targets',
                       'gcc -o helloworld.o -c helloworld.c',
                       'gcc -o helloworld helloworld.o',
                       'scons: done building targets.')
      end
    end

    describe command('cd ./spec/files; scons --tree=all') do
      its(:stdout) do
        should include('+-SConstruct',
                       '+-helloworld',
                       '+-helloworld.o',
                       '+-helloworld.c',
                       '+-/usr/bin/gcc',
                       'scons: done building targets.')
      end
    end
  end
end
