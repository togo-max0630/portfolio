# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    # buildはnewと同じ
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render 'index'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render 'index'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
