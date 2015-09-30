describe 'firefox installation', mega: true, standard: true do
  describe command('firefox -v') do
    its(:exit_status) { should eq 0 }
  end

  describe 'firefox commands' do
    describe command('firefox -CreateProfile test --display=DISPLAY=:99.0 ; ' \
                     'cat ~/.mozilla/firefox/profiles.ini') do
      its(:stdout) { should match 'Name=test' }
    end
  end
end
