class Admins::CategoriesController < Admins::ApplicationController
  
  def index
    @categories = Category.page params[:page] 
  end

  def new
    @category = Category.new()
    @categories_childable =  Category.where(:kind=>0)
    
  end
  
  def create
    check_child
    @category = Category.create!(category_params)
    if  @category.valid?
      flash[:success] = "Category has been created!!"
      redirect_to admins_categories_path 
    else
      flash[:error] = "Please Check your data again!!"
      redirect_to :back 
    end   
  end

  def update
    check_child
    @category = Category.find(params[:id])
    @category.image=nil
    @category.update(category_params)
    if  @category.valid?
      flash[:success] = "Category has been updated!!"
      redirect_to admins_categories_path 
    else
      flash[:error] = "Please Check your data again!!"
      redirect_to :back 
    end   
  end

  def edit
    @category = Category.find(params[:id])
    @categories_childable =  Category.where(:kind=>0)
    @is_child = @category.kind==1 ? true : false 
    # binding.pry
  end

  def  destroy
    Category.destroy(params[:id])
    flash[:alert] = "Category has been  deleted!!"
    redirect_to admins_categories_path 
  end

  protected

  def check_child
    if params[:category][:child_id].to_i !=-1
      child = params[:category][:child_id]
      Category.find(child).update(:kind=>1)
    else  
      params[:category][:child_id] = nil
    end
  end
  def category_params
    params.require(:category).permit(:name,:child_id,:image)
  end
end
