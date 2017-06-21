class ShoppingCart < ApplicationRecord

	has_many :productorder, class_name: => "ProductOrder"

	belongs_to :user, class_name: => "User"


end
