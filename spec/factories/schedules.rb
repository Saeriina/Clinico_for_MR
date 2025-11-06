FactoryBot.define do
  factory :schedule do
    appointment_date { Date.today }
    scheduled_time { "12:00" }
    association :clinic
  end
end
