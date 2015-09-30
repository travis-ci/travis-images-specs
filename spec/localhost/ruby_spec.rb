describe 'ruby installation', mega: true, standard: true, minimal: true do
  describe command('ruby -v') do
    its(:stdout) { should match(/^ruby /) }
    its(:exit_status) { should eq 0 }
  end

  describe 'ruby command is executed' do
    describe command(%(ruby -e 'puts "Konstanin broke all the things!"')) do
      its(:stdout) { should match(/^Konstanin broke all the things!$/) }
    end
  end
end
