class PostsController < ApplicationController

	def index
		@post = Post.new
		@q = Post.ransack(params[:q])
		@posts = @q.result(distinct: true).page(params[:page]).per(4)
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = @post.comments.order(created_at: :desc)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
		  redirect_to posts_path, notice: "作成できたよー"
		else
			@posts = Post.all
			@user = current_user
			render 'index'
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, notice: "アップデートできたよー"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, notice: "削除できたよー"
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id, :category_id, :sub_category_id)
	end
	
end
