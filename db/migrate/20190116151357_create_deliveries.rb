class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :price
      t.string :kind

      t.timestamps
    end
  end
end
