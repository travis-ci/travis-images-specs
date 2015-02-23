require 'spec_helper'

describe 'apt installation ' do

  describe command('sudo apt-get update') do
    its(:stdout) { should match 'Reading package lists... Done'}
  end

  describe command('sudo apt-get install default-jdk') do
    its(:stdout) { should match 'Setting up default-jdk'}
  end
end
