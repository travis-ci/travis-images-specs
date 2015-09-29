describe 'chromium installation', mega: true, standard: true do
  describe package('chromium-browser') do
    it { should be_installed }
  end

  describe 'chromium version' do
    before :all do
      system('chromium-browser --version')
    end

    describe command('chromium-browser --version') do
      its(:exit_status) { should eq 0 }
    end
  end
end
