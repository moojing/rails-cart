class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :city
      t.string :zone
      t.string :post_code
      t.string :address
      t.string :comment
      t.string :price

      t.timestamps
    end
  end
end
