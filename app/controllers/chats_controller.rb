# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    # form_forで送られてきたcontentを含む全てのメッセージの情報の
    # :messageと:room_idのキーがちゃんと入っているかということを条件で確認します。
    # もしその条件がtrueだったら、メッセージを保存するためにMessage.createとし、
    # Messagesテーブルにuser_id、:content、room_idのパラメーターとして送られてきた値を許可
    if Entry.where(user_id: current_user.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(params.require(:chat).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
      redirect_to "/rooms/#{@chat.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
