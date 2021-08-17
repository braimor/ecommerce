class Product < ApplicationRecord
    has_one_attached :image
    validates_presence_of :price, :name
end
