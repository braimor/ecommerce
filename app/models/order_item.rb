class OrderItem < ApplicationRecord
    belongs_to :product
    belongs_to :order

    def total_order_item
        self.quantity * self.price
    end
end
