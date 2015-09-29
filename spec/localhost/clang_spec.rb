describe 'clang installation', mega: true, standard: true, minimal: true do
  describe 'clang version' do
    before :all do
      system('clang -v | head -1')
    end

    describe command('clang -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'clang command' do
    describe command('clang -help; sleep 5') do
      its(:stdout) { should include('OVERVIEW: clang LLVM compiler', 'OPTIONS:') }
    end
  end
end
