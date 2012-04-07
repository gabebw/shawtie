require 'spec_helper'

describe Decoder do
  it 'transforms alphanumeric hashes into IDs' do
    Decoder.new('cb').decode.should == 125
  end

  it 'transforms alphanumeric hashes into large IDs' do
    large_id = 4 * Encoder::BASE**2 + 61 * Encoder::BASE + 0
    Decoder.new('e9a').decode.should == large_id
  end

  it 'returns the same result twice' do
    Decoder.new('cb').decode
    Decoder.new('cb').decode.should == 125
  end
end
