module CurrentCart

    private

    def set_cart
        if defined?(current_user) && !current_user.nil?
            @cart = current_user.cart || Cart.create(user: current_user)
        else
            return render_error(:user_must_exist, :bad_request)
        end
    end

    def render_error(error, status)
        render_errors(I18n.t("errors.#{error}"), status)
    end
end
