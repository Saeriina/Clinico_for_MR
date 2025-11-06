FactoryBot.define do
  factory :product do
    product_name { "デモ製品" }
    diagnosis { "感冒・気管支炎" }
    product_number { "A12345" }
    association :user
  end
end
