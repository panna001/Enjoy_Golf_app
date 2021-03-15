class RoundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:user_id])
    @round = Round.find(params[:id])
    # フェアウェイキープ率の計算
    @fairway_keep_rate = (@round.scores.map{|s|s.fairway_keep_before_type_cast}.sum(0.00) / @round.scores.size * 100).floor
    # パーオン率の計算
    @on_numbers = @round.scores.map{|s|s.par_count - (s.stroke_count - s.putt_count)}
    @under_par_on_rate = (@on_numbers.count(3) / @round.scores.size.to_f * 100).floor
    @par_on_rate = (@on_numbers.count(2) / @round.scores.size.to_f * 100).floor
    # binding.pry
  end

  def new
    @user = current_user
    @round = current_user.rounds.build
    @round.scores.build
  end

  def create
    @user = current_user
    @round = current_user.rounds.build(round_params)
    @round.save
    redirect_to user_round_path(@user,@round)
    if @round.save
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
