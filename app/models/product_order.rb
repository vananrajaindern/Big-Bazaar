class ProductOrder < ApplicationRecord

	belongs_to :product, class_name: => "Product"

	belongs_to :order, class_name: => "Order"

	belongs_to :shoppingcart, class_name: => "ShoppingCart"

end
