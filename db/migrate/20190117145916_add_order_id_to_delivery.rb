class AddOrderIdToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column  :deliveries , :order_id , :string 
  end
end
