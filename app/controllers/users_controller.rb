class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def followings
  end

  def followers
  end
end
