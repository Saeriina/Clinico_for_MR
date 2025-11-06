FactoryBot.define do
  factory :submission do
    title { "提出物デモ" }
    description { "提出物デモ" }
    due_date { Date.today + 7.days }
    association :user
  end
end
