class PagesController < ApplicationController

    def home 
        @new_products = Product.all.order(:create_at).limit(5)
    end 
end
