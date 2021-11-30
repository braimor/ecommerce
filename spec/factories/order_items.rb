FactoryBot.define do
    factory :order_item do
      quantity { Faker::Number.number(digits: 1) }
      price { Faker::Number.number(digits: 2) }
      product
    end
end
