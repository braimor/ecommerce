class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  after_commit :total_value
  validates :total, presence: true
  delegate :name, to: :product

  def total_value
    self.update_column(:total, product.price * quantity)
    cart.update_total
  end
end
