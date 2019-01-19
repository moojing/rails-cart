class Admins::PostsController < Admins::ApplicationController
  def index
    @posts = Post.page params[:page]
  end

  def show
  end

  def create
    @post = Post.new(post_params.except(:category_id))
    post_id = params[:post][:post_id]
    
    if  @post.save
     
        post_id = @post.id 
        unless  params[:post][:image_id].nil?  
            images = params[:post][:image_id] 
            images.each do |image|
              @post.image << Image.find(image)
            end
        end
        
        @post.post_category = PostCategory.find(params[:post][:post_category_id] )

        flash[:success] = "Product has been created!!"
        redirect_to admins_posts_path 
    else
      redirect_back(fallback_location: admins_posts_path)
    end
  end

  def new
    @post = Post.new 
    @categories = PostCategory.all 
  end

  def destroy
  end

  def edit
    @post = Post.find(params[:id]) 
    @categories = PostCategory.all 
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    if  @post.valid?
      flash[:success] = "Category has been updated!!"
      redirect_to admins_posts_path 
    else
      flash[:error] = "Please Check your data again!!"
      redirect_to :back 
    end   
  end

  private
    
  def post_params
      params.require(:post).permit(:title,:description,:image,:post_category_id)
  end
end
