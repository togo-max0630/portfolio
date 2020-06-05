class PostsController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.all
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path

	end

	def update
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
	
end
