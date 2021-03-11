class RoundsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def edit
  end
end
