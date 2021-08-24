# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @products = pagy(Product.all, items: 8)
  end
end
