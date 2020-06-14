class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.new
    @q = Group.ransack(params[:q])
    @groups = @q.result(distinct: true).page(params[:page]).per(4)
    @user = current_user
  end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages.order(created_at: :desc)
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = "新規グループ作成したよ"
      redirect_to groups_path
    else
      @groups = Group.all
      @user = current_user
      render 'index'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "グループ削除したよ"
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
