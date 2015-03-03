require 'spec_helper'

describe 'imagemagick installation' do
  before do
    system('convert logo: logo.gif')
  end

  describe command('identify logo.gif') do
    its(:exit_status) { should eq 0 }
  end
end
