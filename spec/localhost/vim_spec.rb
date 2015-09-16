require 'spec_helper'

describe 'vim installation' do
  describe 'vim version' do
    before :all do
      system('vim --version | head -1')
    end

    describe command('vim --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'vim commands' do
    describe 'add a file and replace text with vim' do
      before do
        system('echo "blume" > ./spec/files/flower.txt')
      end

      describe command('vim flower.txt -c s/blume/flower -c wq') do
        its(:stdout) { should match 'flower' }
      end
    end
  end
end
