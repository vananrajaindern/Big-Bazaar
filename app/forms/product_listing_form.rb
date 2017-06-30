class ProductListingForm
 
include ActiveModel::Model
attr_reader :product_listing

delegate :attributes=, to: :product_listing, prefix: true


validate :product_listing_is_valid? 

def initialize(current_user , params = {})
  #@products=Product.new
  @products = current_user.product_listings.build
  @products_image= @products.images.build
  super(params)
end

def save
  if self.valid?
    @products.save
  end
end

private

def product_listing_is_valid?
  errors.add(:base, 'invalid product insertion') unless product_listing.valid?
end

def product_listing_image_is_valid?

end

end
