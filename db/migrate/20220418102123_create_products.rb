class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.integer :genre_id
      t.string :name
      t.integer :price
      t.text :caption
      t.boolean :sales_status

      t.timestamps

    end
  end
end
