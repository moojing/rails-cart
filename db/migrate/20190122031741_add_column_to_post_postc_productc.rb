class AddColumnToPostPostcProductc < ActiveRecord::Migration[5.2]
  def change
    add_column  :posts , :slug , :string , after: :id
    add_column  :post_categories , :slug , :string , after: :id
    add_column  :categories , :slug , :string , after: :id
  end
end
