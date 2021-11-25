FactoryBot.define do
    factory :cart do
      user
      total { Faker::Number.number(digits: 4) }
    end
end
