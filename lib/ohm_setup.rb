require "ohm"
require "ohm/contrib"

if ENV["REDIS_URL"]
  Ohm.redis = Redic.new(ENV["REDIS_URL"])
end
