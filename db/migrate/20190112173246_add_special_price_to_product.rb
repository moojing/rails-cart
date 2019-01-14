class AddSpecialPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column  :products , :discount_value , :integer ,default: 0
  end
end
