class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    on_numbers = @user.scores.order(id: :DESC).limit(90).map{|s|s.par_count - (s.stroke_count - s.putt_count)}
    @score = (@user.scores.order(id: :DESC).limit(5).sum(:stroke_count) / @user.rounds.limit(5).count.to_f).round(1)
    @putt = (@user.scores.order(id: :DESC).limit(5).sum(:putt_count) / @user.rounds.limit(5).count.to_f).round(1)
    @fairway_keep_rate = (@user.scores.order(id: :DESC).limit(90).where(fairway_keep: "○").count / @user.scores.limit(90).count.to_f * 100).round(1)
    @par_on_rate = (on_numbers.count(2) / @user.scores.limit(90).count.to_f * 100).round(1)
    @under_par_on_rate = (on_numbers.count(3) / @user.scores.limit(90).count.to_f * 100).round(1)
    @carrer = Date.today - @user.start_year
    # binding.pry
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
    params.require(:user).permit(:account_name, :first_name, :last_name, :introduction, :sex, :email, :prefecture, :start_year, :start_month, :profile_image)
  end
end
