RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    Shawtie::Application
  end
end
