class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(users_params)
       redirect_to users_show_path
    else
       render 'edit'
    end
  end
  
  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      sign_out(@user)
       redirect_to root_path
    end
  end
  
  private

  def users_params
    params.require(:user).permit(:name,:sex,:age,:email,:profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to users_show_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end
