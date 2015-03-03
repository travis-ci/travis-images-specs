require 'spec_helper'

describe 'sphinx installation' do

  describe command('cd ../../usr/local/sphinx-22.6/bin; ./indexer') do
    its(:stdout) { should match 'Sphinx 2.2.6-id64-release' }
  end

  describe command('cd ../../usr/local/sphinx-2.1.9/bin; ./indexer') do
    its(:stdout) { should match 'Sphinx Sphinx 2.1.9-release' }
  end

  describe command('cd ../../usr/local/sphinx-2.0.10/bin; ./indexer') do
    its(:stdout) { should match 'Sphinx Sphinx 2.0.10-release' }
  end
end
