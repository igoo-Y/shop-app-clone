class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :name
      t.string :phone
      t.string :email
      t.string :post_code
      t.string :address

      t.timestamps
    end
  end
end
