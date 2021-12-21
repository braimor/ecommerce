# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ExceptionHandler
  include Pagy::Backend
  include CurrentCart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname address gender email password])
  end
end
