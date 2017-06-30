class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.text :description
    	t.text :category
      t.text :title
      t.decimal :price
      t.timestamps
    end
  end
end
