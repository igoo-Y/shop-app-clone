class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = current_user.carts
  end

  def create
    cart = Cart.new(
      pack_id: params[:pack_id],
      user_id: current_user.id,
      quantity: params[:quantity]
    )

    sample_carts = current_user.carts

    remain_cart = sample_carts.find_by(pack_id: params[:pack_id])

    if remain_cart.present?
      sum_quantity = remain_cart.quantity + params[:quantity].to_i

      remain_cart.update(quantity: sum_quantity)
    else
      cart.save
    end

    flash[:notice] = "장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart = Cart.find(params[:id])

    cart.destroy

    redirect_back(fallback_location: root_path)
  end
end
