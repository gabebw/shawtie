RSpec.configure do |config|
  config.before do
    Ohm.redis.flushdb
  end
end
