FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.ru" }

    after(:build) { |u| u.password = u.password_confirmation = 123_456 }
  end
end
