class UsersController < ApplicationController

	def index
		@user = current_user
    @q = User.ransack(params[:q])
		@users = @q.result(distinct: true).page(params[:page]).per(5)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		if params[:id].to_i == current_user.id
       @user = User.find(params[:id])
    else
       @user = current_user
       redirect_to user_path(current_user)
    end
	end

	def quit
	end

	def out
    @user = current_user
    @user.update(is_valid: true)
    reset_session
    flash[:notice] = "ありがとうございました。"
    redirect_to root_path
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
      flash[:notice] = "アップデートできたよ"
			redirect_to user_path
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
    @followers = @user.follower_user
  end


	private
	def user_params
		params.require(:user).permit(:name, :nickname, :profile_image, :introduction)
	end

end
