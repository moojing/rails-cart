class Admins::PostCategoriesController < Admins::ApplicationController
  def index
    @categories = PostCategory.page params[:page]
  end

  def show
  end

  def create
    @category = PostCategory.create!(post_category_params) 
    if  @category.valid?
      flash[:success] = "Category has been created!!"
      redirect_to admins_post_categories_path 
    else
      flash[:error] = "Please Check your data again!!"
      redirect_to :back 
    end   
  end

  def new
    @category = PostCategory.new
  end

  def destroy
    PostCategory.destroy(params[:id])
    flash[:alert] = "Category has been  deleted!!"
    redirect_to admins_post_categories_path 
  end

  def edit
    @category = PostCategory.find(params[:id]) 
  end

  def update
  
    @category = PostCategory.find(params[:id])
    @category.update(post_category_params)
    
    if  @category.valid?
      flash[:success] = "Category has been updated!!"
      redirect_to admins_post_categories_path 
    else
      flash[:error] = "Please Check your data again!!"
      redirect_to :back 
    end   
  end

  private 
  def post_category_params
    params.require(:post_category).permit(:title,:image)
  end 
end
