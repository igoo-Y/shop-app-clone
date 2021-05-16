class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carts = current_user.carts
  end

  def create
    Cart.create(
      pack_id: params[:pack_id],
      user_id: current_user.id,
      quantity: params[:quantity]
    )

    flash[:notice] = "장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?"

    redirect_back(fallback_location: root_path)
  end
end
