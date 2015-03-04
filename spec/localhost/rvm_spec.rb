require 'spec_helper'

describe 'rvm installation' do
  describe command('rvm version') do
    its(:stdout) { should match 'rvm' }
  end

  describe command('rvm list') do
    its(:stdout) { should include('rvm rubies', 'current') }
  end
end
