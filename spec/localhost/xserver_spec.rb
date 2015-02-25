require 'spec_helper'

describe 'xserver installation' do

  describe 'xserver version' do
    describe command('Xorg -version') do
      its(:stdout) { should match 'X.Org X Server 1.11.3' }
    end
  end

end
