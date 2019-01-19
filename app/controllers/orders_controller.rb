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
    cartList =session[:cartList]
    newOrder = Order.new(order_params.except(:coupon))
    
    order_total_price = 0

    coupon = Coupon.find_by(:code=>params[:order][:coupon]) 
    if coupon
        order_total_price -= coupon.discount.to_i
    end

    newOrder.save

    cartList.each do |product|
        newOI = OrderItem.new(
            :product_id=>product['id'],
            :num=>product['num'],
            :single_price=>product[:price],
            :total_price=> product['price'].to_i * product['num'].to_i )

        newOrder.order_items << newOI
        newOI.order = newOrder 
        newOI.save
        order_total_price += product['price'].to_i * product['num'].to_i 
        
    end


    newOrder.price = order_total_price
    newOrder.save
 
    newOrder.create_delivery(delivery_params) 
    
    
    if newOrder.save
        session.delete(:cartList)
        cookies.delete(:cartList)
        redirect_to '/orders/success'
    else
        flash[:errors] = newOrder.errors
        redirect_back
    end


    
  end

  def show
  end

  def index
  end

  def destroy
  end

  def success 
    render 'pages/success'
  end
  
  private
  
    def order_params
        params.require(:order).permit(:phone,:zone,:city,:first_name,:last_name,:post_code,:address,:comment,:coupon,:email)
    end

    def delivery_params 
         params.require(:delivery).permit(:kind,:price)
    end 
end
