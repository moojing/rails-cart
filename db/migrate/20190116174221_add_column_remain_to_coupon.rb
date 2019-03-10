class AddColumnRemainToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column  :coupons , :remain , :integer , default:0
    change_column :coupons, :expire_at , 'timestamptz using expire_at::timestamptz'
  end
end
