class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :pack, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
