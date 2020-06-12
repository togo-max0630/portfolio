class RerationshipsController < ApplicationController

  def follow
    current_user.follow(params[:id])
    @user = User.find(params[:id])
    render 'users/follow'

  end

  def unfollow
    current_user.unfollow(params[:id])
    @user = User.find(params[:id])
    render 'users/unfollow'
  end

    # 自分がフォローしているユーザー一覧
  def following
    @user = current_user
    @users = User.all
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = current_user
    @users = User.all
  end

  
end
