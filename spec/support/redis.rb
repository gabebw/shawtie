RSpec.configure do |config|
  config.before do
    Ohm.flush
  end
end
