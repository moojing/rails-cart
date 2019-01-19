class CartController < ApplicationController
    def show 
        require 'json'
        @total = 0
        session.delete(:cartList)
        if cookies[:cartList] && cookies[:cartList].length>0
            @cartList=JSON.parse cookies[:cartList]
            @cartList.each do |cart|
                product = Product.find(cart['product_id'])
                cart['id'] = product.id
                cart['name'] = product.name
                cart['image'] = product.image
                cart['price'] = product.price.to_i - product.discount_value.to_i
                @total +=  cart['price'] * cart['num'].to_i
            end
            session[:cartList]=@cartList
        else
        
        @cartList =  []
        
        end
 
    end    
end
