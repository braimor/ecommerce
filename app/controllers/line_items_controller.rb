class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def new
    @line_item = LineItem.new
  end

  def create
      product = Product.find(params[:product_id])
      @product_line_item = @cart.line_items.find_by(product: product)
      if @product_line_item && params[:line_item].present?
        @product_line_item.update_attribute(quantity: @product_line_item.quantity + line_item_params[:quantity])
      elsif @product_line_item 
        @product_line_item.quantity += 1
        @product_line_item.save!
      elsif params[:line_item].present?
        line_item = @cart.line_items.create!(product: product, quantity: line_item_params[:quantity])
      else
        line_item = @cart.line_items.create!(product: product)
      end
      redirect_to root_path
  end

  def update
      line_item.update!(quantity: (line_item.quantity = line_item_params[:quantity].to_i))
      redirect_to cart_path
  end

  private

  def line_item
    @line_item ||= LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity)
  end

end
