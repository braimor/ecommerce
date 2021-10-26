class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
  end

  def show
    @cart
  end

  private

  def cart_params
    params.require(:cart).permit(:user)
  end
end
