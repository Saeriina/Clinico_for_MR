FactoryBot.define do
  factory :available_time do
    weekday { "月" }
    available_time_slot { "12:00" }
    association :clinic
    association :user
  end
end
