class ShoppingcartsController < ApplicationController
  def new
  end
  
  def index

  end
  
  def create 
  end
  
  def destroy
  end

  def show
    @order_items = ProductOrder.where(shopping_cart_id: session[:cartid]) 
    
 end

end
