FactoryBot.define do
  factory :visit_interval do
    interval { 30 }
    association :clinic
  end
end
