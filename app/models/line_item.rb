class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  after_save :total_value
  validates :total, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  delegate :name, to: :product

  private

  def total_value
    self.update_column(:total, product.price * quantity)
    cart.update_total
  end
end
