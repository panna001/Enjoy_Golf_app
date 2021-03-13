class RoundsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:user_id])
    @round = Round.find(params[:id])
    @fairway_keep_rate = @round.scores.sum(:fairway_keep)
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
      redirect_to round_path(@round)
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
