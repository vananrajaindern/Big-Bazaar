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
    byebug
    @order_items = ProductOrder.where(shopping_cart_id: session[:cartid]).map(&:order).select{ |f| f.orderstatus !='Paid' }
    #@order=@order_items.pluck(:order_id)
    @totalprice = 0

    #Order.find(ProductOrder.find_by(shopping_cart_id: 1)[:order_id])
 end

end
