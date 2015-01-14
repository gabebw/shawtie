require_relative "../../lib/encoder"

class Link < Ohm::Model
  include Ohm::Callbacks

  attribute :url
  attribute :hash

  index :url
  index :hash

  protected

  def after_create
    set_hash
  end

  def set_hash
    self.hash = Encoder.new(self.id.to_i).encode
    save
  end
end
