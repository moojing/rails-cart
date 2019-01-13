class Admins::CategoriesController < Admins::ApplicationController
  
  def index
    @categories = Category.page params[:page] 
  end

  def new
    @category = Category.new
    @categories_parentable =  Category.where(:kind=>0)
    
  end
  
  def create
     
    check_child
    @category = Category.create!(category_params)

    if params[:category][:parent_id].to_i !=-1
      @category.kind = 1 
      @category.save
    end 

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
    # @category.image=nil
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
    @categories_parentable =  Category.where(:kind=>0)
     
    # binding.pry
  end

  def  destroy
    Category.destroy(params[:id])
    flash[:alert] = "Category has been  deleted!!"
    redirect_to admins_categories_path 
  end

  protected

  def check_child
    
    if params[:category][:parent_id].to_i !=-1
      parent = params[:category][:parent_id]
      Category.find(parent).update(:kind=>0)
      if !params[:id].nil?
        Category.find(params[:id]).update(:kind=>1)
      end
    else  
      Category.find(params[:id]).update(:kind=>0)
      params[:category][:parent_id] = nil
    end
  end

  def category_params
    params.require(:category).permit(:name,:parent_id,:image)
  end
end
