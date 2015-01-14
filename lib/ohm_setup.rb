require "ohm"
require "ohm/contrib"

if ENV["REDISTOGO_URL"]
  Ohm.redis = Redic.new(ENV["REDISTOGO_URL"])
end
