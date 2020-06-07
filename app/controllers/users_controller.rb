class UsersController < ApplicationController

	def index
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def quit
	end

	def out
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path, notice: "アップデートできたよー"
		else
			render 'edit'
		end
	end

	# 自分がフォローしているユーザー一覧
  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end


	private
	def user_params
		params.require(:user).permit(:name, :nickname, :profile_image, :introduction)
	end

end
