FactoryBot.define do
    factory :product do
      name { Faker::Commerce.product_name }
      price { Faker::Commerce.price }
      
      trait :with_image do
        after(:build) do |product|
          product.image.attach(
            io: File.open(Rails.root.join('spec/support/files/airpods.png')),
            filename: 'airpods.png',
            content_type: 'image/png'
          )
        end
      end
    end
end
