class CategoriesController < ApplicationController
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
