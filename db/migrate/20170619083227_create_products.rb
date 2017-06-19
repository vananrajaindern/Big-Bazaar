class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.text :description
    	t.text :category

      t.timestamps
    end
  end
end
