class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.boolean :has_promotion
      t.decimal :promotional_price
      t.text :descripion

      t.timestamps
    end
  end
end
