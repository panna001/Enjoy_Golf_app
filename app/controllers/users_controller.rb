class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user)
    else 
      render :edit
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
  private
  def user_params
    params.require(:user).permit(:account_name, :first_name, :last_name, :introduction, :sex, :email, :prefecture, :start_year, :start_month, :profile_image)
  end
end
