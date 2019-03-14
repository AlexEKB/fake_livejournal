FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Name#{n}" }
    sequence(:last_name) { |n| "Surname#{n}" }
    sequence(:email) { |n| "user#{n}@mail.ru" }

    after(:build) { |u| u.password = u.password_confirmation = 123_456 }
  end
end
