require 'spec_helper'

describe 'postgres installation' do

  describe 'postgres version' do
    before :all do
      system('psql --version')
    end

    describe command ('psql --version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'psql commands' do
    describe command('createdb test_db; psql --list') do
      its(:stdout) { should match 'test_db' }
    end

    describe command('psql -c "CREATE TABLE test_table();" test_db; psql -c "\dt" test_db') do
      its(:stdout) { should match 'test_table'}
    end
  end

end
