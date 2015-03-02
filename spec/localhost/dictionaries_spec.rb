require 'spec_helper'

describe 'dictionaries installation' do
  describe package('wamerican') do
    it { should be_installed }
  end
  
  describe 'dictionaries commands' do
    describe command('look colonized') do
      its(:stdout) { should match 'colonize\ncolonized\ncolonizer' }
    end
    
    describe command('look colonised') do
      its(:exit_status) { should eq 0 }
    end
  end
end
