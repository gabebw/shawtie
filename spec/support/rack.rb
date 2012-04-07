RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each, type: :request) do
    Capybara.app = app
  end

  def app
    Shawtie::Application
  end
end
