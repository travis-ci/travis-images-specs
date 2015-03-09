require 'spec_helper'

describe 'python and pip installation ' do

  describe command('python --version') do
    its(:exit_status) { should eq 0 }
  end

  describe command('pip --version'), sudo: true do
    its(:stdout) { should match 'pip 6.0.7'}
  end

  describe command('pip --version'), sudo: false do
    its(:stdout) { should match 'pip 6.0.7'}
  end

end

describe 'Python command is executed' do
  describe command('python -c "print 123 + 123"') do
    its(:stdout) { should match '246' }
  end
end





