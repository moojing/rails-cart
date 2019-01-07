class Admins::ProductsController < Admins::ApplicationController

    def new 
        
        @product = Product.new
        @categories = Category.all
        
         
    end
    
    def create
        
        @product = Product.new(product_params)
        
        if @product.valid?
          @product.save
          redirect_to admin_root_path
        else
          render :new
        end
    end

    def product_params
        params.require(:product).permit(:sku,:name,:content,:price,:stock,:enable)
    end
end


