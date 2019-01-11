class AddDefaultValueToCategoryKind < ActiveRecord::Migration[5.2]
  def up
    change_column :categories, :kind, :integer, default: 0
  end
  
  def down
    change_column :categories, :kind, :integer 
  end
end
