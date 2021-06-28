FactoryBot.define do
  factory :relationship do
    friend1_id { 1 }
    sequence(:friend2_id) { |i| i+1 }
  end
end
