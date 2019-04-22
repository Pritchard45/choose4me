class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    # @category = Category.new
    # @category.title = params[:category][:title]
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash[:notice] = "Category saved."
      redirect_to @category
    else
      flash.now[:alert] = "There was an error creating your Category."
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    # @category.title = params[:category][:title]
    @category.assign_attributes(category_params)

    if @category.save
      flash[:notice] = "Category updated."
      redirect_to @category
    else
      flash.now[:alert] = "There was an error saving the category."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:notice] = "\"#{@category.title}\" was deleteed successfully"
      redirect_to categories_path
    else
      flash.now[:alert] = "There was an error deleting the category"
      render :show
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :public)
  end
end
