FactoryBot.define do
  factory :clinic do
    clinic_name { "テストクリニック" }
    doctor_name { "テストドクター" }
    association :user
  end
end
