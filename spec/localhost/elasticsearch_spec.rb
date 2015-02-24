require 'spec_helper'

describe 'elasticsearch installation' do

  describe package('elasticsearch') do
    it { should be_installed }
  end

  describe 'elasticsearch commands', sudo: true do

    before :all do
      system('sudo service elasticsearch start')
    end

    describe command ('sudo service elasticsearch status') do
      its(:stdout) { should match 'elasticsearch is running' }
    end
end


