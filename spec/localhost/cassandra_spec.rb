require 'spec_helper'

describe 'cassandra installation' do

  describe command('which cassandra') do
    its(:stdout) { should match '/local/bin/cassandra'}
  end

  describe 'cassandra commands', sudo: true do

    before :all do
      system('sudo /etc/init.d/cassandra start')
      system('sleep 10')
    end

    describe service('cassandra') do
      it { should be_running } 
    end

    describe command ('cassandra-cli -host localhost -port 9160 &') do
      its(:stdout) { should match 'Connected to: \"Test Cluster\" on localhost/9160' }
    end

    # describe command ('cassandra-cli "connect localhost/9160;" 
    #                     "create keyspace Twissandra;" 
    #                     "use Twissandra;" 
    #                     "create column family User with comparator = UTF8Type;" 
    #                     "update column family User with column_metadata =
    #                     [
    #                     {column_name: first, validation_class: UTF8Type},
    #                     {column_name: last, validation_class: UTF8Type},
    #                     {column_name: age, validation_class: UTF8Type, index_type: KEYS}
    #                     ];" 
    #                     "assume User keys as utf8;" 
    #                     "set User['adakota']['first'] = 'Allen';
    #                     set User['adakota']['last'] = 'Dakota';
    #                     set User['adakota']['age'] = '45';" 
    #                     "get User['adakota'];"')do
    #   its(:stdout) { should include( 'name=age', 'value=45', 'name=first', 'value=Allen', 'name=last', 'value=Dakota' ) }
    # end
  end
end