class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  before_save :total_value
  validates :total, presence: true

  def total_value
    total = 0
    product.each do |product|
      total += product.price * quantity
    end
    total
  end
end
