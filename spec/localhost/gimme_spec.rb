require 'spec_helper'

describe 'gimme installation' do
  describe command('gimme --version') do
    its(:stdout) { should match 'v0.2.2' }
  end
end

describe 'gimme command is executed' do
  describe command('gimme --list;') do
    its(:stdout) { should match '1.4.1 \<\= current' }
  end

  describe command('go version') do
    before do
      system('gimme 1.3; source ~/.gimme/envs/go1.3.env; sleep 5')
    end
    its(:stdout) { should match 'go version go1.3 linux/amd64' }
  end
end