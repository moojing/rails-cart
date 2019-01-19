class Order < ApplicationRecord
    has_many :order_items , :primary_key => :order_id
    has_one :delivery , :foreign_key => :order_id

    def create_delivery(delivery_params)
        newDelivery  = Delivery.new(delivery_params) 
        newDelivery.order_id = self.id 
        newDelivery.save
    end
end
