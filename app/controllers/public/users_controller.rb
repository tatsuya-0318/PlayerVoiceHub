class Public::UsersController < ApplicationController
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
  
end
