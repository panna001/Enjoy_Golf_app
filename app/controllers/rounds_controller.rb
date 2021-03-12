class RoundsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).per(10)
  end

  def show
    @round = Round.find(params[:id])
    @fairway_keep_rate = @round.scores.sum(:fairway_keep)
  end

  def new
    @round = current_user.rounds.build
    @round.scores.build
  end
  
  def create
    @round = current_user.rounds.build(round_params)
    @round.save
    redirect_to round_path(@round)
    if @round.save
    else
      render :new
    end
  end

  def edit
  end
  
  private
  def round_params
    params.require(:round).permit(:play_date, :place, :weather, :wind, scores_attributes: [:hole_number, :par_count, :stroke_count, :putt_count, :fairway_keep, :ob_count, :penalty_count, :id])
  end
  
end
