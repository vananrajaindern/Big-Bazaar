class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.text :orderstatus
    	t.text :paymentstatus
      t.integer :user_id

      t.timestamps
    end
  end
end
