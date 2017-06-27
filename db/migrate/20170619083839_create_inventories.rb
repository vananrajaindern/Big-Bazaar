class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
    	t.integer :qty
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
