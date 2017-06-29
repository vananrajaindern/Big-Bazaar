class OrdersController < ApplicationController
  def new
  end
  
  def index
    @orders=ProductOrder.joins(:ShoppingCart)
    
  end
  
  def create 
  end
  
  def destroy

    @order = current_order(params[:id])
    @order.destroy
    redirect_to shoppingcart_path(session[:cartid])
  end

end
