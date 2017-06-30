class Product < ApplicationRecord

	has_many :inventory, class_name: "Inventory"

	has_many :productimage, class_name: "ProductImage", dependent: :destroy
	
	has_many :productorder, class_name: "ProductOrder"

end
