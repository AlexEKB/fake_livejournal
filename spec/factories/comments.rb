FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "comment text#{n}" }

    association :user
    association :post
  end
end
