class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
  end

  def update
    current_cart.update(cart_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def cart
    @cart ||= Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user)
  end
end
