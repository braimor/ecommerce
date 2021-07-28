class Product < ApplicationRecord
    has_one_attached :image

    validate-presense-of :price, :name
end
