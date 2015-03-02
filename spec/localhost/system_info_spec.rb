require 'spec_helper'

describe 'system_info exist' do

  describe command('cat /usr/share/travis/system_info*') do
    its(:exit_status) { should eq 0 }
  end

end
