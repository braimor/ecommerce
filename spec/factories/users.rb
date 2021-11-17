FactoryBot.define do
    factory :user do
      name { Faker::Name.first_name }
      surname { Faker::Name.last_name }
      email { Faker::Internet.email }
      password { '123456' }
    end
end
