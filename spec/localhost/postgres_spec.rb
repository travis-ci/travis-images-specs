require 'spec_helper'

describe 'postgres installation' do

  describe command ('psql --version') do
    its(:stdout) { should match 'psql' }
  end

  describe command('createdb test_db; psql --list') do
    its(:stdout) { should match 'test_db' }
  end

  describe command('psql -c "CREATE TABLE test_table();" test_db; psql -c "\dt" test_db') do
    its(:stdout) { should match 'test_table'}
  end
end