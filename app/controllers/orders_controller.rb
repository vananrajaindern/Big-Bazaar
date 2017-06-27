class OrdersController < ApplicationController
  def new
  end
  
  def index
    @orders=ProductOrder.joins(:ShoppingCart)
    
  end
  
  def create 
  end
  
  def destroy
  end

end
