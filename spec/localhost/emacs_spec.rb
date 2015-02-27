require 'spec_helper'

describe 'emacs installation' do

  describe command('emacs --version') do
    its(:exit_status) { should eq 0 }
  end

end
