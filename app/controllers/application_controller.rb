class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :userName ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :userName ])
  end

  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    articles_path
  end
end
