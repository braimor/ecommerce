class LineItemsController < ApplicationController
  before_action :set_cart, only: [:create]

  def new
    @line_item = LineItem.new
  end

  def create
      product = Product.find(params[:product_id])
      @product_line_item = @cart.line_items.find_by(product: product)
      if @product_line_item
        @product_line_item.quantity += 1
        @product_line_item.save!
      elsif params[:line_item].present?
        if !line_item_params[:quantity].present? || line_item_params[:quantity].to_i < 0
          return render_error(:cannot_create_line_item_with_wrong_params, :bad_request)
        else
          line_item = @cart.line_items.create!(product: product, quantity: line_item_params[:quantity])
        end
      else
        line_item = @cart.line_items.create!(product: product)
      end
      params[:type] != "Buy now" ? (redirect_to root_path) : (redirect_to new_order_path)
  end

  def update
    if defined?(current_user) && !current_user.nil?
      if !line_item_params[:quantity].present? || line_item_params[:quantity].to_i < 0
        return render_error(:cannot_update_to_wrong_value, :bad_request)
      else
        if line_item_params[:quantity].to_i.eql? 0
          line_item.destroy!
          redirect_to root_path
        else
          line_item.update!(quantity: (line_item.quantity = line_item_params[:quantity].to_i))
          params[:type] != "Buy now" ? (redirect_to cart_path) : (redirect_to new_order_path)
        end
      end
    else
      return render_error(:user_must_exist, :bad_request)
    end
  end

  private

  def line_item
    @line_item ||= LineItem.find(params[:id])
  end

  def render_error(error, status)
    render_errors(I18n.t("errors.#{error}"), status)
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
