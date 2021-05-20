class AddCancelReasonToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :cancel_reason, :text
  end
end
