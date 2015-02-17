require 'spec_helper'

describe 'Installation' do
  it 'expects the correct ruby version to be installed' do
    expect(RUBY_VERSION).to include('2.1.2')
  end

  describe command('ruby -v') do
    its(:stdout) { should match '2.1.2' }
  end

  describe command('rvm list default') do
    its(:stdout) { should match '1.9.3' }
  end
end
