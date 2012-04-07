class Link < Ohm::Model
  attribute :url
  attribute :hash

  index :hash

  def validate
    assert_present :url
    assert_present :hash
  end
end
