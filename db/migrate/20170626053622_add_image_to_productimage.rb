class AddImageToProductimage < ActiveRecord::Migration[5.1]
  def change
    add_column :product_images, :image, :string
  end
end
