require 'spec_helper'

describe 'Installation' do
  it 'expects the correct ruby version to be installed' do
    expect(RUBY_VERSION).to include('ruby 1.9.3')
  end
end
