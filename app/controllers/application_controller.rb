class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sing_up, keys: [:name, :age])
    elsif resource_class == Shop
      devise_parameter_sanitizer.permit(:sing_up, keys: [:name, :genre])
    else
      super
    end
  end
end
