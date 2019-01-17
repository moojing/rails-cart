class AddColumnToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column  :coupons , :code , :text , null: false,limit:10
    change_column :coupons ,:used ,:integer
  end
end
