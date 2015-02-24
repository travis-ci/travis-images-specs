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

    describe service('rabbitmq') do
      it { should be_running }
    end

    describe command ('sudo service rabbitmq-server status') do
      its(:stdout) { should match 'running_applications' }
    end

    describe command ('sudo rabbitmqctl status') do
      its(:stdout) { should include('Status of node rabbit@localhost','running_applications') }
    end

    describe 'rabbitmqadmin commands' do

      before do
        system('./bin/rabbitmqadmin declare queue name=my-test-queue durable=false')
        system('./bin/rabbitmqadmin publish exchange=amq.default routing_key=my-test-queue payload="hello, world" ')
      end

      describe command ('./bin/rabbitmqadmin list queues') do
        its(:stdout) { should include('my-test-queue', '1') }
      end

      describe command ('./bin/rabbitmqadmin get queue=my-test-queue requeue=false') do
        its(:stdout) { should include('my-test-queue', 'hello, world') }
      end

      describe command ('./bin/rabbitmqadmin list queues') do
        its(:stdout) { should include('my-test-queue', '0') }
      end

    end
  end
end





#sudo service rabbitmq-server start
#curl https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v3_4_4/bin/rabbitmqadmin > rabbitmqadmin
#sudo chmod 755 rabbitmqadmin
#./rabbitmqadmin declare queue name=my-new-queue durable=false
#./rabbitmqadmin publish exchange=amq.default routing_key=my-new-queue payload="hello, world"
#./rabbitmqadmin list queues
##expect 1
#./rabbitmqadmin get queue=my-new-queue requeue=false
##expect payload
#./rabbitmqadmin list queues
##expect 0
