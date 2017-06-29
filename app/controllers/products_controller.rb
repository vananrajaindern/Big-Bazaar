class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  

  def new
    @products = Product.new

    @product_listing_form = ProductListingForm.new(current_user)
  end

  def create
    #@products = Product.create(product_params)
    @product_listing_form= ProductListingForm.new(product_params)
    if @products.save
      redirect_to products_index_path
    else
      render :new
    end
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    set_photo
    @productimage=ProductImage.find(params[:id])
    if @products.update_attributes(product_params) and @productimage.update_attributes(photo_params)
      redirect_to product_path(@products)
    else
      render :edit
    end
  end

  def destroy
    @products=Product.find(params[:id]).destroy
    redirect_to root_path
  end

  def index
    @user = current_user
    @order_item = ProductOrder.new
    @products = Product.all.order('created_at DESC')

  end

  def show
    @products= Product.find(params[:id])
  end

  private

  def set_photo
    @products = Product.find(params[:id])
  end

  def product_params
    params.require(:product_listing_form).permit(product_listing_attributes [:category, :title, :description])

  end

  def photo_params
    params.require(:product_listing_form).permit(product_listing_attributes[:image])
  end

end
