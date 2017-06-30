class StatisticsController < ApplicationController
  def index
    @sales = ProductOrder.all
    @user_name= {}
    @sales.group(:user_id).count.each do |k, v|
      @user_name[User.find(k).email]=v
    end

    @sales_with_title = {}    
    @sales.group(:product_id).count.each do |k, v| 
      @sales_with_title[Product.find(k).title] = v  
    end


  end
end