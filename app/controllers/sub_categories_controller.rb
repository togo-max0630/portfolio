class SubCategoriesController < ApplicationController

  def index
    @sub_category = SubCategory.new
    @sub_categories = SubCategory.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to sub_categories_path
    else
      @sub_categories = SubCategory.all
      render 'index'
    end
  end

  def destroy
  end

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end
end
