class Admins::ProductsController < Admins::ApplicationController

    def new 
        
        @product = Product.new
         
    end
    
    def create
        
        @product = Product.new(product_params)
        
        if @product.valid?
          @product.save
          redirect_to [:admins,@product]
        else
          render :new
        end
    end

    def product_params
        params.require(:product).permit!
    end
end


