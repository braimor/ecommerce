class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    before_save :update_total
    belongs_to :user
    validates :total_quantity, presence: true

    def update_total
        total_quantity = 0
        line_items.each do |line_item|
            total_quantity += line_item.total_value
        end
        total_quantity
    end

    def calculate_quantity
        total_quantity = 0
        line_items.each do |line_item|
            total_quantity += line_item.quantity
        end
        total_quantity
    end
end
