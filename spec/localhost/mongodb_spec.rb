require 'spec_helper'

describe 'mongodb installation' do

  #describe package('mongo') do
    #it { should be_installed }
  #end

  describe command ('monog --version') do
    its(:stdout) { should match 'mongoDB shell version' }
  end

end
