require 'spec_helper'

describe Encoder do
  it 'transforms IDs into alphanumeric hashes' do
    Encoder.new(125).encode.should == 'cb'
  end

  it 'transforms large IDs into alphanumeric hashes' do
    large_id = 4 * Encoder::BASE**2 + 61*Encoder::BASE + 0
    Encoder.new(large_id).encode.should == 'e9a'
  end

  it 'returns the same result twice' do
    Encoder.new(125).encode
    Encoder.new(125).encode.should == 'cb'
  end
end
