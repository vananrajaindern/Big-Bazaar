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
   
    @paidorders = ProductOrder.where(user_id: current_user.id).map(&:order).select{ |f| f.orderstatus =='Paid' }
    @allorders= ProductOrder.where(user_id: current_user.id).map(&:order).select{ |f| f.orderstatus !='Paid' }

  end

  def update
    @order = current_order
    @order_item = @order.order.find(params[:id])
    @order_item.update_attributes(order_item_params)
  end

  def destroy

  end



end

