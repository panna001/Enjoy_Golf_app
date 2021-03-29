class RoundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.order(play_date: :DESC).page(params[:page]).per(5)
    # 以下userコントローラからコピー
    unless @user.rounds.blank?
      @score = @user.average.round(1)
      @putt = @user.get_average_score(:putt_count).round(1)
      @fairway_keep_rate = (@user.get_average_score(:fairway_keep) * 100 / 18).round(1)
      @par_on_rate = (@user.get_average_score(:par_on) * 100 / 18).round(1)
    end
    # グラフ表示
    @stroke_data = @user.rounds.map{|r| [r.play_date.to_s, r.stroke_count]}
    @putt_data = @user.rounds.map{|r| [r.play_date.to_s, r.putt_count]}
  end

  def show
    @user = User.find(params[:user_id])
    @round = Round.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @round = current_user.rounds.build
    unless @user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @user = current_user
    @round = current_user.rounds.build(round_params)
    if @round.save
      average = current_user.get_average_score(:stroke_count)
      rank = current_user.rank_check
      @user.update_attributes(rank: rank, average: average)
      redirect_to user_rounds_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @round = current_user.rounds.find(params[:id])
    unless @user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @user = current_user
    @round = current_user.rounds.find(params[:id])
    if @round.update(round_params)
      rank = current_user.rank_check
      average = current_user.get_average_score(:stroke_count)
      @user.update_attributes(rank: rank, average: average)
      redirect_to user_round_path(@user, @round)
    else
      render :edit
    end
  end

  def destroy
    @round = current_user.rounds.find(params[:id])
    @round.destroy
    redirect_to user_rounds_path(current_user)
  end

  private
  def round_params
    params.require(:round).permit(:play_date, :place, :weather, :wind, :stroke_count, :putt_count, :fairway_keep, :par_on, :ob_count, :penalty_count)
  end

end
