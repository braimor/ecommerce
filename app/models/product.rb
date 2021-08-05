# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  include Pagy::Frontend
  validates_presence_of :price, :name
end
