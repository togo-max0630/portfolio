class SubCategoriesController < ApplicationController

  def index
    @sub_category = SubCategory.new
    @sub_categories = SubCategory.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      flash[:notice] = "サブカテゴリー作成したよ"
      redirect_to sub_categories_path
    else
      @sub_categories = SubCategory.all
      render 'index'
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    flash[:notice] = "メッセージ削除したよ"
    render 'index'
  end

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end
end
