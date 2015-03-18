require 'spec_helper'

describe 'python and pip installation ' do

  describe 'python version' do
    before :all do
      system('python --version')
    end

    describe command('python --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'pip version' do
    before :all do
      system('pip --version')
    end

    describe command('pip --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'python command is executed' do
    describe command('python -c "print 123 + 123"') do
      its(:stdout) { should match '246' }
    end
  end

end





