require 'spec_helper'

describe 'minGW' do
  describe command ('gcc') do
    its(:stdout) { should include('gcc:', 'no input files') }
  end
end
