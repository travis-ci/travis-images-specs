require 'spec_helper'

describe 'java installation' do
  describe command('java -version') do
    its(:stdout) { should match 'java version \"1.7.0_76\"' }
  end
end
