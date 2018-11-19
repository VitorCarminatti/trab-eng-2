class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.string :session_id
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
