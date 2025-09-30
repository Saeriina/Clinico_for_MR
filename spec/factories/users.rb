FactoryBot.define do
  # factory :user do
  #   email { "user@example.com" }
  #   name  { "user_name" }
  #   password { "password" }
  #   password_confirmation { "password" }
  # end
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    name  { "user_name" }
    password { "password" }
    password_confirmation { "password" }
  end
end
