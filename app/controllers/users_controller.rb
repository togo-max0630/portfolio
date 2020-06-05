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


	private
	def user_params
		params.require(:user).permit(:name, :nickname, :profile_image, :introduction)
	end

end
