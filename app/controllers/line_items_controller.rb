class LineItemsController < ApplicationController

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.create(line_item_params)
  end

  private

  def line_item
    @line_item ||= LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
end
