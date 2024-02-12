class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully created"
      redirect_to @category
    else
      render 'new', status: 422
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
