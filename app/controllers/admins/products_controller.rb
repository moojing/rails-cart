class Admins::ProductsController < Admins::ApplicationController

    def index 
        @products = Product.page params[:page]
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
            unless  params[:product][:image_id].nil?  
                images = params[:product][:image_id] 
                images.each do |image|
                    @product.image << Image.find(image)
                end
            end

            ProductCategory.create!(category_id: category_id, product_id: product_id) 
          
            flash[:success] = "Product has been created!!"
            redirect_to admins_products_path 
        else
          render :new
        end

    end

    def edit
        @product = Product.find(params[:id])
        @categories = Category.all
    end

    def update 
        
        @product = Product.find(params[:id])
        @product.update(product_params.except(:category_id))
        category =  Category.find( params[:product][:category_id]) 
        @product.categories.clear  << category
        
        if @product.save
            
            unless  params[:product][:image_id].nil?  
                images = params[:product][:image_id] 
                @product.image.clear
                images.each do |image|
                    @product.image << Image.find(image)
                end
            end

            flash[:success] = "Product has been  updated!!"
            redirect_to admins_products_path 
        else
            redirect_to :back   
        end
      
    end 

    def  destroy
        Product.destroy(params[:id])
        flash[:alert] = "Product has been  deleted!!"
        redirect_to admins_products_path 
    end

    private
    
    def product_params
        params.require(:product).permit(:sku,:name,:content,:price,:stock,:discount_value,:enable,:category_id)
    end
end


