class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
    	 t.references :order, foreign_key: true
       t.references :product, foreign_key: true
       t.integer :shopping_cart_id
       t.integer :user_id
      t.timestamps
    end
  end
end
