class Order < ApplicationRecord

	has_many :productorder, class_name: "ProductOrder", dependent: :destroy
	belongs_to :user, class_name: "User" , optional: true
	
end
