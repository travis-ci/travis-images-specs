require 'spec_helper'

describe 'ccache installation' do
  describe command('ccache -V') do
    its(:stdout) { should match 'ccache version 3.1.6' }
  end
end

describe 'ccache commands are executed' do
  describe command('ccache -s') do
    its(:stdout) { should include('cache directory', 'cache hit', 'cache miss', 'files in cache', 'max cache size') }
  end

  describe command('ccache -M 3') do
    its(:stdout) { should match 'Set cache size limit to 3.0 Gbytes' }
  end
end