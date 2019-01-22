class PostsController < ApplicationController
    def show 
        @post = Post.find(params[:slug])
    end
end
