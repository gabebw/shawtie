require 'spec_helper'

describe Encoder do
  it 'transforms IDs into alphanumeric hashes' do
    expect(Encoder.new(125).encode).to eq 'cb'
  end

  it 'transforms large IDs into alphanumeric hashes' do
    large_id = 4 * Encoder::BASE**2 + 61*Encoder::BASE + 0
    expect(Encoder.new(large_id).encode).to eq 'e9a'
  end

  it 'returns the same result twice' do
    Encoder.new(125).encode

    expect(Encoder.new(125).encode).to eq 'cb'
  end
end
