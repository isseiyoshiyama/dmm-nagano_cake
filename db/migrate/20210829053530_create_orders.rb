class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :poastal_code
      t.string :name
      t.integer :shipping_fee
      t.integer :payment_method
      t.integer :total_fee
      t.integer :status

      t.timestamps
    end
  end
end
