FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    name  { "user_name" }
    password { "password" }
  end
end
