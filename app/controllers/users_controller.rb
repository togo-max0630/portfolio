# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    # #roomがcreateされた時、現在ログインしているユーザーと「チャットへ」を
    # 押されたユーザーの両方をEntriesテーブルに記録するため、whereメソッドでそのユーザーを探している
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    # ログインしているユーザーかどうかわけ、roomsが作成されている場合とで条件分岐させてる。
    if @user.id == current_user.id
    else
      # @currentUserEntryと@userEntryを一つずつ取り出し、Entries内にあるroom_idが共通しているユーザー同士に
      # @roomId= cu.room_idという変数を指定する
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      @user = current_user
      redirect_to user_path(current_user)
    end
  end

  def quit; end

  def out
    # 退会機能
    @user = current_user
    @user.update(is_valid: true)
    reset_session
    flash[:notice] = 'ありがとうございました。'
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'アップデートできたよ'
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
    params.require(:user).permit(:name, :nickname, :profile_image, :postal_code, :residence, :introduction, :category, :sub_category)
  end
end
