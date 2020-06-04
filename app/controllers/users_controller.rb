class UsersController < ApplicationController

	def index
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def quit
	end

	def out
	end

	def update
	end

	private
	def user_params
		params.require(:user).permit(:name, :nickname, :profile_image, :introduction)
	end

end
