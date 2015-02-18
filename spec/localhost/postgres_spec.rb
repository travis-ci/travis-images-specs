require 'spec_helper'

describe 'postgres installation' do

  describe command ('psql --version') do
    its(:stout) { should match 'psql' }
  end

  describe command('createdb test; psql --list') do
    its(:stdout) { should match 'test' }
  end

end