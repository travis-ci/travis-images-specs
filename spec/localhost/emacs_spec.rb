require 'spec_helper'

describe 'emacs installation' do
  describe 'emacs version' do
    before :all do
      system('emacs --version | head -1')
    end

    describe command('emacs --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'add a file and write text into it with emacs' do
    before do
      system('emacs -batch ./spec/files/flower.txt --eval \'(insert "Butterblume")\' -f save-buffer')
    end

    describe command('cat ./spec/files/flower.txt') do
      its(:stdout) { should match 'Butterblume' }
    end
  end
end
