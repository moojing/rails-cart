class PostCategoriesController < ApplicationController
    def show 
        @post_category = PostCategory.find(params[:slug])
        @posts = Post.where(post_category_id:  @post_category.id)
        
    end
end
