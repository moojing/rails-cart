class Add < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_categries, :product_categories
    add_column :product_categories ,:product_id, :integer
    add_column :product_categories ,:category_id, :integer
    
  end
end
