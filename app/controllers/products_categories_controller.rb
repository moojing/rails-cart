class ProductsCategoriesController < ApplicationController


    def show
        @category = Category.find(params[:slug])
        @products = @category.products.order("#{params[:sort]} #{params[:order]}").page params[:page]
        
       
    end

    

end
