class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :used
      t.string :discount
      t.string :expire_at

      t.timestamps
    end
  end
end
