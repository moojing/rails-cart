class Admins::ProductsController < Admins::ApplicationController

    def index 
        @products = Product.all
    end

    def new 
        
        @product = Product.new
        @categories = Category.all
        
         
    end
    
    def create
        
        @product = Product.new(product_params.except(:category_id))
        
        category_id = params[:product][:category_id]
        
        if @product.valid?
          @product.save
          product_id = @product.id 
          
          images = params[:product][:image_id] 
          images.each do |image|
            @product.image << Image.find(image)
          end
          
          ProductCategory.create!(category_id: category_id, product_id: product_id) 
          
          redirect_to admin_root_path
        else
          render :new
        end

    end

    def product_params
        params.require(:product).permit(:sku,:name,:content,:price,:stock,:enable,:category_id)
    end
end


