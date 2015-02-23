require 'spec_helper'

describe 'python installation ' do

  describe command('python --version') do
    its(:stdout) { should match 'Python'}
  end
end

describe 'Python command is executed' do
  describe command('python -c "print 123 + 123"') do
    its(:stdout) { should match '246' }
  end
end





