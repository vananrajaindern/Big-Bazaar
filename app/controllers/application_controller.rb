class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_order
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :last_name, :provider, :uid])
  end

  def current_order(id)

    if !session[:cartid].nil? #Existing Session
      return ProductOrder.find_by(shopping_cart_id: session[:cartid], order_id: id)
    else # New Session

      @cart=ShoppingCart.create()
      session[:cartid]=@cart.id

    end
  end
end
