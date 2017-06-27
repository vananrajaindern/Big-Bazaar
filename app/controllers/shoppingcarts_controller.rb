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
    @order=@order_items.pluck(:order_id)
    #Order.find(ProductOrder.find_by(shopping_cart_id: 1)[:order_id])
 end

end
