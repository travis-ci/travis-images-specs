require 'spec_helper'

describe 'nodejs installation' do
  describe command('node -v') do
    its(:stdout) { should match 'v0.10.36'}
  end

  describe command('node -e "console.log("Konstantin broke all the thingz")"') do
    its(:stdout) { should match 'Konstantin broke all the thingz'}
  end
end
