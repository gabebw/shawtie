require 'ohm'
require 'ohm/contrib'

if ENV["REDISTOGO_URL"]
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Ohm.connect(:host => uri.host, :port => uri.port, :password => uri.password)
end
