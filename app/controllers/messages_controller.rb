class MessagesController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    # buildはnewと同じ
    @message = @group.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save
    flash[:notice] = "メッセージ送信したよ"
    render 'index'
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "メッセージ削除したよ"
    render 'index'
  end
  
  
  private

  def message_params
    params.require(:message).permit(:content, :group_id, :user_id)
  end

end
