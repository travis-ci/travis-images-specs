require 'spec_helper'

describe 'dictionaries installation' do
  describe package('wamerican') do
    it { should be_installed }
  end
end
  
describe 'dictionaries commands' do
  describe command('look colonize') do
    its(:stdout) { should include('colonize', 'colonized', 'colonizer') }
  end
  
  describe command('look colonise') do
    its(:stdout) { should equal '' }
  end
end
