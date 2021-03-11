class RoundsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @user = current_user
    @round = Round.new
    @round.scores.build
  end
  
  def create
    @user = current_user
    @round = current_user.rounds.build(round_params)
    @round.save
    # if @round.save
      redirect_to user_round_path(user_id: current_user, id: @round.id)
    # else
    #   render :new
    # end
  end

  def edit
  end
  
  private
  def round_params
    params.require(:round).permit(:date, :place, :weather, :wind, scores_attributes: [:hole_number, :par_count, :stroke_count, :put_count, :fairway_keep, :ob_count, :penalty_count, :par_on])
  end
  
end
