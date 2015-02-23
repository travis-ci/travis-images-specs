require 'spec_helper'

describe 'rabbitmq installation' do

  describe package('rabbitmq-server') do
    it { should be_installed }
  end

  describe 'rabbitmq commands', sudo: true do

    before do
      system('sudo service rabbitmq-server start')
      sleep 5
    end

    describe service('rabbitmq-server') do
      it { should be_running }
    end

    describe command ('sudo service rabbitmq-server status') do
      its(:stdout) { should match 'running_applications' }
    end

    describe command ('sudo rabbitmqctl status') do
      its(:stdout) { should match 'Status of node rabbit@localhost','running_applications' }
    end
  end

end
