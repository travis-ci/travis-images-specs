describe 'mingw', mega: true, standard: true, minimal: true do
  describe command('gcc -v') do
    its(:stdout) { should include('gcc ') }
  end

  describe command ('gcc') do
    its(:stderr) { should include('gcc:', 'no input files') }
  end
end
