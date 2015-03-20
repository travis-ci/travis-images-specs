require 'spec_helper'

describe 'nodejs installation' do

  describe 'nodejs version' do
    before :all do
      system('node -v')
    end

    describe command('node -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'node commands' do
    describe command('node -e "console.log(\'Konstantin broke all the thingz\')"') do
      its(:stdout) { should match 'Konstantin broke all the thingz'}
    end
  end

end
