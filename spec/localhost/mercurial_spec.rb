require 'spec_helper'

describe 'mercurial installation' do
  describe command('hg version') do
    its(:stdout) { should match 'Mercurial Distributed SCM \(version 2.0.2\)' }
  end
end

describe 'mecurial commands are executed' do
  describe command('hg init test-project; sleep 3; cd ./spec/test-project; sleep 3; touch test-file.txt; sleep 3; hg status') do
    its(:stdout) { should match '? test-file.txt' }
  end

  # describe command('hg add .; hg status') do
  #   its(:stdout) { should match 'A test-file.txt' }
  # end

  #  describe command('hg forget test-file.txt; hg status') do
  #   its(:stdout) { should match '$hg  test-file.txt' }
  # end



end