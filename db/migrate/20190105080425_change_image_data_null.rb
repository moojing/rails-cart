class ChangeImageDataNull < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :image_data, :text, :null => true
  end
end
