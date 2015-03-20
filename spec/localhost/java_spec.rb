require 'spec_helper'

describe 'java installation' do

  describe 'java version' do
    before :all do
      system('java -version | head -1')
    end

    describe command('java -version') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe 'java command' do
    before do
      system('javac ./spec/files/Hello.java')
    end

    describe command('java Hello') do
      its(:stdout) { should match 'Hello' }
    end
  end

end
