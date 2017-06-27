class ProductImage < ApplicationRecord

	belongs_to :product, class_name: "Product"
  mount_uploader :image, ImageUploader

end

