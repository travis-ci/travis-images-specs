describe 'ruby installation', mega: true, standard: true, minimal: true do
  describe 'ruby version' do
    before :all do
      system('ruby -v')
    end

    describe command('ruby -v') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'ruby command is executed' do
    describe command('ruby -e \'puts \"Konstanin broke all the things!\"\'') do
      its(:stdout) { should match 'Konstanin broke all the things' }
    end
  end
end
