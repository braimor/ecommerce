class Order < ApplicationRecord
    belongs_to :user
    validates_presence_of :phone, :address
    has_many :order_items

    def calculate_total
        total_amount = 0
        self.order_items.each do |item|
            total_amount += item.total_order_item
        end
        self.total = total_amount
        self.save!
    end
end
