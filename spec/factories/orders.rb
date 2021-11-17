FactoryBot.define do
    factory :order do
      phone { '099999999' }
      total { '2500' }
      address { 'Carlos Quijano' }
      user_id { '1' }
    end
end


