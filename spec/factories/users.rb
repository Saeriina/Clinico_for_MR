FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    name  { "user_name" }
    password { "password" }
    password_confirmation { "password" }

    after(:build) do |user|
      user.password = user.password
    end

    after(:create) do |user|
      user.save!(validate: false)
    end
  end
end
