require 'spec_helper'

describe 'dictionaries installation' do
  describe package('wamerican') do
    it { should be_installed }
  end
end
  
describe 'dictionaries commands' do
  describe command('look colonized') do
    its(:stdout) { should include('colonize', 'colonized', 'colonizer') }
  end
  
  describe command('look colonised') do
    its(:stdout) { should match nil }
  end
end
