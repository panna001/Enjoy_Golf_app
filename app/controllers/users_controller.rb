class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.includes(:rounds, :scores).order(id: :desc).page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
    unless @user.rounds.blank?
      @score = @user.get_average_score(:stroke_count)
      @putt = @user.get_average_score(:putt_count)
      @fairway_keep_rate = @user.get_fairway_keep_rate.round(1)
      @par_on_rate = @user.get_on_rate(2).round(1)
      @under_par_on_rate = @user.get_on_rate(3).round(1)
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_back(fallback_location: root_path)
    end
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
    params.require(:user).permit(:account_name, :first_name, :last_name, :introduction, :sex, :email, :prefecture, :start_year, :start_month, :teens, :profile_image)
  end
end
