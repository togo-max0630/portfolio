# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    # buildはnewと同じ
    @message = @group.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save
    render 'index'
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    render 'index'
  end

  private

  def message_params
    params.require(:message).permit(:content, :group_id, :user_id)
  end
end
