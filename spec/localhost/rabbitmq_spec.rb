require 'spec_helper'

describe 'rabbitmq installation' do

  describe package('rabbitmq') do
    it { should be_installed }
  end

  describe 'rabbitmq commands', sudo: true do

    before do
      system('sudo server rabbitmq-server start')
      sleep 5
    end

    describe service('rabbitmq') do
      it { should be_running }
    end
  end

end
