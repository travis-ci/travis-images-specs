require 'spec_helper'

describe 'apt installation ' do

  describe 'apt commands', sudo: true do
    describe command('sudo apt-get update') do
      its(:stdout) { should match 'Reading package lists...'}
    end

    describe command('sudo apt-get install default-jdk') do
      its(:stdout) { should match 'Setting up default-jdk'}
    end
  end
end
