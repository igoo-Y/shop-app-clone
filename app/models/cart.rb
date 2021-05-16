class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :pack

  def verified_save
    # cart = self
    sample_carts = user.carts

    remain_cart = sample_carts.find_by(pack_id: pack_id)

    if remain_cart.present?
      sum_quantity = remain_cart.quantity + quantity.to_i

      remain_cart.update(quantity: sum_quantity)
    else
      save
    end
  end
end
