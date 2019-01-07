class AddProductColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price ,:string
    add_column :products, :stock ,:string
    add_column :products, :sku ,:string
    add_column :products, :enable ,:integer
  end
end
