class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :num
      t.string :product_id
      t.string :order_id
      t.string :single_price
      t.string :total_price

      t.timestamps
    end
  end
end
