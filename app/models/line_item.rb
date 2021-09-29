class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  before_save :total_value
  validates :total, presence: true

  def total_value
    total = product.price * quantity
  end
end
