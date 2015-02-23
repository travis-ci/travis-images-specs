require 'spec_helper'

describe 'python and pip installation ' do

  describe command('python --version') do
    its(:stdout) { should match 'Python 2.7.3'}
  end

  describe command('pip --version') do
    its(:stdout) { should match 'pip 6.0.7'}
  end

end

describe 'Python command is executed' do
  describe command('python -c "print 123 + 123"') do
    its(:stdout) { should match '246' }
  end
end





