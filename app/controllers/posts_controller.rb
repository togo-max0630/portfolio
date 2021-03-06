# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  impressionist actions: [:show]

  def index
    @post = Post.new
    @user = current_user
    @like = Like.new
    @q = Post.ransack(params[:q])
    if params[:tag_id].present?
      @posts = Tag.find(params[:tag_id]).posts.page(params[:page]).per(4)
    else
      # ransack.kaminair.impressionistのGem適応@posts = Post.all
      @posts = @q.result(distinct: true).page(params[:page]).per(4).order(impressions_count: 'DESC')
    end

    # pageのランク付け
    @page = if params[:page].nil?
              0
            else
              (params[:page].to_i - 1) * 4
            end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    # アクセス数のカウント
    impressionist(@post, nil, unique: [:ip_address])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path if @post.user != current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿作成したよ'
      redirect_to posts_path
    else
      @user = current_user
      @q = Post.ransack(params[:q])
      if params[:tag_id].present?
        @posts = Tag.find(params[:tag_id]).posts.page(params[:page]).per(4)
      else
        # ransack.kaminair.impressionistのGem適応@posts = Post.all
        @posts = @q.result(distinct: true).page(params[:page]).per(4).order(impressions_count: 'DESC')
      end

      @page = if params[:page].nil?
                0
              else
                (params[:page].to_i - 1) * 4
              end
      render 'index'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'アップデートしたよ'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = '削除したよ'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :category_id, :sub_category_id, tag_ids: [])
  end
end
