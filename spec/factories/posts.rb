FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "title#{n}" }
    sequence(:text) { |n| "text#{n}" }

    association :user
  end
end
