class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
  end

  private

  def cart_params
    params.require(:cart).permit(:user)
  end
end
