require 'spec_helper'

describe 'bazaar installation' do
  describe command('bzr version') do
    its(:stdout) { should match 'Bazaar \(bzr\) 2.5.1' }
  end
end

describe 'bazaar commands are executed' do
  before :all do
    system('bzr init bzr-project; cd bzr-project; touch test-file.rb')
  end

  describe command('cd bzr-project; bzr status') do
    its(:stdout) { should include('unknown:', 'test-file.rb') }
  end

  describe command('cd bzr-project; bzr add test-file.rb') do
    its(:stdout) { should match 'adding test-file.rb' }
  end

   describe command('cd bzr-project; bzr status') do
    its(:stdout) { should include('added:', 'test-file.rb') }
  end
end