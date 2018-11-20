class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_type_id
      t.decimal :total

      t.timestamps
    end
  end
end
