class OrdersController < ApplicationController
    before_action :set_cart, only: [:create, :new]

    def index
        if defined?(current_user) && !current_user.nil?
            @orders = current_user.orders
        else
            return render_error(:user_must_exist, :bad_request)
        end
    end

    def new
        @order = Order.new
    end

    def create
        if order_params[:address].length == 0 || order_params[:phone].length == 0
            return render_error(:cannot_create_null_params_order, :bad_request)
        else
            if @order = Order.create(order_params.merge(user: current_user))
                @cart.line_items.each do |item|
                    @order.order_items.create!(
                        product_id: item.product_id,
                        quantity: item.quantity,
                        price: item.product.price
                    )
                    item.delete
                end
            end
        end
        @order.calculate_total
        redirect_to orders_path
    end

    def show
        if defined?(current_user) && !current_user.nil?
            order
        else
            return render_error(:user_must_exist, :bad_request)
        end
    end

    private

    def order
        @order ||= Order.find(params[:id])
    end

    def render_error(error, status)
        render_errors(I18n.t("errors.#{error}"), status)
    end

    def order_params
        params.require(:order).permit(:address, :phone, :user_id)
    end
end
