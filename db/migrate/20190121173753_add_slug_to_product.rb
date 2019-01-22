class AddSlugToProduct < ActiveRecord::Migration[5.2]
  def change
    change_table :products do |t|
      t.string :slug, after: :id
    end
  end
end
