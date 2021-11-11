class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :phone, null: false
      t.integer :total, null: false, default: 0
      t.string :address, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
