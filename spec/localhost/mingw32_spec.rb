require 'spec_helper'

describe 'minGW' do

  describe 'gcc version' do
    before :all do
      system('gcc -v 2>&1 | tail -1')
    end
  end

  describe command ('gcc') do
    its(:stdout) { should include('gcc:', 'no input files') }
  end
end
