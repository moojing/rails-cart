class PostCategoriesController < ApplicationController
    def show 
        @post_category = PostCategory.find(params[:id])
        @posts = Post.where(post_category_id: params[:id])
        
    end
end
