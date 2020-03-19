FactoryBot.define do
  factory :invoice do
    association :customer
    association :merchant
    status { Faker::Boolean.boolean }
  end
end
