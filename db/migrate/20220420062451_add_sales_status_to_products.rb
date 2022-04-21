class AddSalesStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sales_status, :boolean, default: false, null: false
  end
end
