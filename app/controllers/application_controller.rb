class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :last_name, :provider, :uid])
  end
end
