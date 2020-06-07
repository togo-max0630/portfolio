class RerationshipsController < ApplicationController
  before_actioin :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "フォロー成功"
      redirect_to @user
    else
      flash.now[:alert] = "フォロー失敗"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = "フォロー解除"
      redirect_to @user
    else
      flash.now[:alert] = "フォロー解除失敗"
      redirect_to @user
    end
  end

  def follow
  end

  def follower
  end
  

  private
  def 
    @user = User.find(params[:relationship][:follow_id])
  end
    
  
end
