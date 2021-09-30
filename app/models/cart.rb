class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    before_save :update_total
    validates :total, presence: true

    def update_total
        total = 0
        line_items.each do |line_item|
            total += line_item.total_value
        end
        total
    end
end
