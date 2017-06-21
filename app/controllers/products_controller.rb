class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @products = Product.new
  end

  def create
    @products = Product.create(product_params)

    if @products.save
      redirect_to products_index_path
    else
      render :new
    end
  end

  def edit
    @products = Product.find(params[:id])
  end

  def destroy
    @products=Product.find(params[:id]).destroy
    redirect_to products_index_path
  end

  def index
    @user = current_user
    @products = Product.all.order('created_at DESC')
  end

  def show
    @products= Product.find[params[:id]]
  end

  private

  def product_params
    params.require(:product).permit(:category, :title, :description)
  end
end
