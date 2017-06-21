class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

 def new
  @products = Product.new
end

def create
end

def edit
end

def destroy
end

def index
  byebug
 @user = current_user

 @products = Product.all.order('created_at DESC')

end
end
