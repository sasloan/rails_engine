FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    unit_price { Faker::Commerce.price }
    association :merchant
  end
end
