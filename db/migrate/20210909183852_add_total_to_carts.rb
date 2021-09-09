class AddTotalToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :total, :integer, null: false, default: 0
  end
end
