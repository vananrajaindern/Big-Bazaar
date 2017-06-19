class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
    	t.integer :qty

      t.timestamps
    end
  end
end
