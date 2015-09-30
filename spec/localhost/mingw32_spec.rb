describe 'mingw', mega: true, standard: true, minimal: true do
  describe command('gcc -v') do
    its(:stderr) { should match(/^gcc version/) }
  end

  describe command ('gcc') do
    its(:stderr) { should include('gcc:', 'no input files') }
  end
end
