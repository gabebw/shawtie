require "securerandom"

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
    self.hash = SecureRandom.urlsafe_base64(8)
    save
  end
end
