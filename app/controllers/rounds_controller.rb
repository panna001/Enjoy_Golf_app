class RoundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).order(id: :DESC).per(5)
    # 以下userコントローラからコピー
    unless @user.rounds.blank?
      @score = @user.get_average_score(:stroke_count)
      @putt = @user.get_average_score(:putt_count)
      @fairway_keep_rate = @user.get_fairway_keep_rate.round(1)
      @par_on_rate = @user.get_on_rate(2).round(1)
      @under_par_on_rate = @user.get_on_rate(3).round(1)
    end
    # グラフ表示
    @round_data = @user.rounds.map{|r| [r.play_date.to_s, r.scores.sum(:stroke_count)]}
  end

  def show
    @user = User.find(params[:user_id])
    @round = Round.find(params[:id])
    @fairway_keep_rate = @round.fairway_keep_rate.floor
    @under_par_on_rate = @round.get_on_rate(3).floor
    @par_on_rate = @round.get_on_rate(2).floor
  end

  def new
    @user = current_user
    @round = current_user.rounds.build
    @round.scores.build
  end

  def create
    @user = current_user
    @round = current_user.rounds.build(round_params)
    if @round.save
      rank = current_user.rank_check
      average = current_user.get_average_score(:stroke_count)
      @user.update_attributes(rank: rank, average: average)
      redirect_to user_round_path(@user, @round)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @round = current_user.rounds.find(params[:id])
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
    params.require(:round).permit(:play_date, :place, :weather, :wind, scores_attributes: [:hole_number, :par_count, :stroke_count, :putt_count, :fairway_keep, :ob_count, :penalty_count, :id, :_destroy])
  end

end
