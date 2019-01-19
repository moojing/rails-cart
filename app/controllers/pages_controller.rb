class PagesController < ApplicationController

    def home 
        @new_products = Product.all.order(:created_at).limit(5)
        @posts = Post.all.order(:created_at).limit(3)
    end 
end
