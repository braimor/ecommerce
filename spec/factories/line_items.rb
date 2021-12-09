FactoryBot.define do
    factory :line_item do
      product
      cart
      quantity { Faker::Number.number(digits: 1) }
    end
end
