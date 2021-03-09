class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
end
