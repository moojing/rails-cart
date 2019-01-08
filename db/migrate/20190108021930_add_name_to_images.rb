class AddNameToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images ,:name, :string
    add_column :images ,:product_id, :integer, :default => -1


  end
end
