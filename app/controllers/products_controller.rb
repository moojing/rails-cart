class ProductsController < ApplicationController
    def show 
        @product = Product.find(params[:slug])
         
        related = Category.find(@product.categories[0].id).products.limit(4)
        if  related.count < 4 
            @related_products = Product.all.limit(4)
        else
            @related_products = related
        end 
        
    end
end
