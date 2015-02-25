require 'spec_helper'

describe 'clang installation' do
  describe command('clang -v') do
    its(:stdout) { should match 'clang version 3.4' }
  end

  describe 'clang command is executed' do
    describe command('clang -help; sleep 5') do
      its(:stdout) { should include('OVERVIEW: clang LLVM compiler','OPTIONS:') }
    end
  end
end
