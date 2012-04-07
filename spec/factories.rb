FactoryGirl.define do
  factory :link do
    ignore do
      url 'http://example.com'
      sequence(:hash) { |n| "hash#{n}" }
    end

    initialize_with { Link.create(url: url, hash: hash) }
  end
end
