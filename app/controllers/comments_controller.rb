class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    # buildはnewと同じ
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:notice] = "コメント送信したよ"
    render 'index'
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメント削除したよ"
    render 'index'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
