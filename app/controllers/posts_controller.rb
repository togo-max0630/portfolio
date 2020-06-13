class PostsController < ApplicationController

	def index
		@post = Post.new
		@q = Post.ransack(params[:q])
		@posts = @q.result(distinct: true).page(params[:page]).per(4)
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		# アクセス数のカウント(同じ人が見た場合無効)

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
			flash[:notice] = "投稿作成したよ"
		  redirect_to posts_path
		else
			@posts = Post.all
			@user = current_user
			render 'index'
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "アップデートしたよ"
			redirect_to posts_path
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "削除したよ"
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id, :category_id, :sub_category_id, tag_ids: [])
	end
	
end
