class ProductOrdersController < ApplicationController
  before_action :authenticate_user!

 def create
  @order = Order.new(user_id: current_user.id)
  @order.save!
  @productorder = ProductOrder.new(user_id: current_user.id, order_id: @order.id, shopping_cart_id: params[:product_order][:shopping_cart_id],product_id: params[:product_order][:product_id])
  @productorder.save!
  redirect_to root_path
  
end

def new
end

def index
  @currentOrder=ProductOrder.where(user_id: current_user.id).group(shopping_cart_id)
  @allorders=ProductOrder.all.group(shopping_cart_id)
end

def update
  @order = current_order
  @order_item = @order.order.find(params[:id])
  @order_item.update_attributes(order_item_params)
  @order_items = @order.order
end

def destroy
  @order = current_order
  @order.destroy
  redirect_to shoppingcart_path(session[:cartid])
end

private
# def order_item_params
#   params.require(:productorder).permit(params[:product_order][:shopping_cart_id], :order_id,[:product_order][:product_id])
# end
end

