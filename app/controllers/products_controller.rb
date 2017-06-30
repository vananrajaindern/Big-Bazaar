class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  

  def new
    @products = Product.new

    #@product_listing_form = ProductListingForm.new(current_user)
  end

  def create
    @products = Product.create(product_params)
    #@product_listing_form= ProductListingForm.new(product_params)
    if @products.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @products = Product.find(params[:id])
    #@product_listing_form = ProductListingForm.new(product_params)
  end


  def update
    #set_photo
    byebug
    @productimage=ProductImage.find_by(product_id: params[:id])
    if @products.update_attributes(product_params) and @productimage.update_attributes(photo_params)
      byebug
      redirect_to products_path
      #redirect_to shoppingcarts_path
      #redirect_to root_path
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
    params.require(:product).permit(:category, :title, :description, :price)

  end

  def photo_params
    params.require(:productimage).permit(:image)
  end

end
