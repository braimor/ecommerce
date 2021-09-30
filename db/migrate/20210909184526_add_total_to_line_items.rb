class AddTotalToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :total, :integer, null: false, default: 0
  end
end
