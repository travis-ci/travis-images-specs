require 'spec_helper'

describe 'Ruby installation' do
  describe command('rvm list default') do
    its(:stdout) { should match '1.9.3' }
  end

  describe command('rvm list known') do
    its(:stdout) { should match '1.9.3' }
  end

  describe 'Ruby command is executed' do
    describe command('ruby -e \'puts \"Konstanin broke all the things!\"\'') do
      its(:stdout) { should match 'Konstanin broke all the things' }
    end
  end
end
