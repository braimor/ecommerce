# frozen_string_literal: true

class ProductsController < ApplicationController
  def show
    @product = Product.find params[:id]
    @product_line_item = cart.line_items.find_by(product: @product) if current_user  
  end
  
  private

  def cart
    current_user.cart
  end
end
