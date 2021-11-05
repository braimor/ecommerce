class OrdersController < ApplicationController
    before_action :set_cart, only: [:create, :new]

    def index
        @orders = current_user.orders
    end

    def new
        @order = Order.new
    end

    def create
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
        @order.calculate_total
        redirect_to orders_path
    end

    def show
        order
    end

    private

    def order
        @order ||= Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(:address, :phone, :user_id)
    end
end
