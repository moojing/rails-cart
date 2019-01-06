class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.text :image_data

      t.timestamps
    end
  end
end
