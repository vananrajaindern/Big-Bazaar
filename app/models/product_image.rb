class ProductImage < ApplicationRecord
  attr_accessible :image
  
	belongs_to :product, class_name: "Product"
  mount_uploader :image, ImageUploader

end

