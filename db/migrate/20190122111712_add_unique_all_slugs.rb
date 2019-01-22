class AddUniqueAllSlugs < ActiveRecord::Migration[5.2]
  def change
    change_column  :posts , :slug , :string , :index => { :unique => true }
    change_column  :post_categories , :slug , :string ,  :index => { :unique => true }
    change_column  :categories , :slug , :string ,  :index => { :unique => true }
    change_column  :products , :slug , :string , :index => { :unique => true }
  end
end
