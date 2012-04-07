FactoryGirl.define do
  factory :link do
    ignore do
      url 'http://example.com'
    end

    initialize_with { Link.new(url: url) }
  end
end
