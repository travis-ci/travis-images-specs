require 'spec_helper'

describe 'emacs installation' do

  describe command('emacs --version') do
    its(:exit_status) { should eq 0 }
  end

  describe 'read file with emacs' do
    before :all do
      system('echo "Butterblume" > butterblume.txt')
    end

    describe command('emacs --batch -l butterblume.txt') do
      its(:stdout) { should match 'Butterblume' }
    end

    describe command('emacs --batch -l ./spec/files/flower.el butterblume.txt -f flower') do
      its(:stdout) { should match 'Wrote' }
    end
  end

#https://www.gnu.org/software/emacs/manual/html_node/emacs/Command-Example.html#Command-Example
#
#https://www.fnal.gov/docs/products/emacs/emacs/emacs_36.html


end
