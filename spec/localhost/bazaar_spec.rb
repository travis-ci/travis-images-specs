require 'spec_helper'

describe 'bazaar installation' do
  describe command('bzr version') do
    its(:stdout) { should match 'Bazaar \(bzr\) 2.5.1' }
  end
end

describe 'bazaar commands are executed' do
  before :all do
    system('bzr init test-project; cd test-project; touch test-file.rb')
  end

  describe command('cd test-project; bzr status') do
    its(:stdout) { should match 'unknown:\ntest-file.rb' }
  end

  describe command('cd test-project; bzr add test-file.rb') do
    its(:stdout) { should match 'adding test-file.rb' }
  end

   describe command('cd test-project; bzr status') do
    its(:stdout) { should match 'added:\ntest-file.rb' }
  end
end