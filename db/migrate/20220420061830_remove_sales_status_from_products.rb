class RemoveSalesStatusFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :sales_status, :boolean
  end
end
