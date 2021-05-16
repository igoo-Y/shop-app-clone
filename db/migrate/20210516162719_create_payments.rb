class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.json :response
      t.string :imp_uid
      t.decimal :amount
      t.string :merchant_uid

      t.timestamps
    end
  end
end
