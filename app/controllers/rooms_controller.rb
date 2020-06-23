# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    # form_forの@roomで送られてきたパラメータをここでcrate
    @room = Room.create
    # 現在ログインしているユーザー
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # 相手側の情報
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    # 上記をクリエイトして飛ぶ
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    # Entriesテーブルに、
    # 現在ログインしているユーザーのidとそれにひもづいたチャットルームのidをwhereメソッドで探し、
    # そのレコードがあるか確認します。
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @entries = @room.entries
    else
    # なかったら入れません
      redirect_back(fallback_location: root_path)
    end
  end
end
