class AddImageFieldToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories , :image_data, :text
  end
end
