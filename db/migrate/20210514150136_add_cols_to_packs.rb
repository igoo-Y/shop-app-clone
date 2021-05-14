class AddColsToPacks < ActiveRecord::Migration[6.0]
  def change
    add_column :packs, :price, :decimal
    add_column :packs, :is_publish, :boolean, default: true
  end
end
