FactoryBot.define do
  factory :order do
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    address { Faker::Address.street_address }
    user
  end
end
