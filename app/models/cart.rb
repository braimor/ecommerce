class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :user
    validates :total, presence: true

    def update_total
        total_amount = 0
        line_items.each do |line_item|
            total_amount += line_item.total
        end
        self.total = total_amount
        self.save!
    end

    def calculate_quantity
        total_quantity = 0
        line_items.each do |line_item|
            total_quantity += line_item.quantity
        end
        total_quantity
    end
end
