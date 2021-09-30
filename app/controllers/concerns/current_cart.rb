module CurrentCart

    private

    def set_cart
        @cart = current_user.cart || Cart.create(user: current_user)
    end
end

