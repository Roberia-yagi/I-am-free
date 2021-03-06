FactoryBot.define do
  factory :user, aliases: [:owner] do
    provider { 'twitter' }
    sequence(:uid) { |i| i }
    sequence(:twitter_id) { |i| "name#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
  end
end
