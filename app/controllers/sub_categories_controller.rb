# frozen_string_literal: true

class SubCategoriesController < ApplicationController
  # user_adminしか見ることができない
  before_action :user_admin, only: [:index]

  def index
    @sub_category = SubCategory.new
    @sub_categories = SubCategory.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      flash[:notice] = 'サブカテゴリー作成したよ'
      redirect_to sub_categories_path
    else
      @sub_categories = SubCategory.all
      render 'index'
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    flash[:notice] = 'メッセージ削除したよ'
    render 'index'
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end

  # user_adminの定義づけ
  def user_admin
    @sub_category = SubCategory.new
    @sub_categories = SubCategory.all
    if current_user.admin == false
      redirect_to root_path
    else
      render action: 'index'
    end
  end
end
