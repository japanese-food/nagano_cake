class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_post_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :postage
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :status
      t.timestamps
    end
  end
end
