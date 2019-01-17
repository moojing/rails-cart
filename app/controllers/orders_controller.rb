class OrdersController < ApplicationController
  def new
        require 'json'
        @total = 0
        if cookies[:cartList]
            @cartList=JSON.parse cookies[:cartList]
          
            @cartList.each do |cart|
                product = Product.find(cart['product_id'])
                cart['id'] = product.id
                cart['name'] = product.name
                cart['image'] = product.image
                cart['price'] = product.price.to_i - product.discount_value.to_i
                cart['product_total_price'] = cart['price'].to_i * cart['num'].to_i
                @total +=  cart['product_total_price'] 
                
            end
           
        else
           @cartList=[]
          redirect_back
        
        end

  end

  def create
    
  end

  def show
  end

  def index
  end

  def destroy
  end
  
  private
  
    def order_params
        params.require(:order).permit(:phone,:first_name,:last_name,:post_code,:address,:comment,:delivery,:coupon)
    end

    def delivery_params 
         params.require(:delivery).permit(:kind,:price)
    end 
end
