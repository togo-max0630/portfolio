class CategoriesController < ApplicationController
  # user_adminしか見ることができない
  before_action :user_admin, only: [:index]
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリー作成したよ"
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "カテゴリー削除したよ"
    render 'index'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  # user_adminの定義づけ
  def user_admin
    @category = Category.new
    @categories = Category.all
    if current_user.admin == false
      redirect_to root_path
    else
      render action: "index"
    end
  end


end
