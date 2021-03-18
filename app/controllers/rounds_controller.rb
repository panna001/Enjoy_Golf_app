class RoundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @rounds = @user.rounds.page(params[:page]).order(id: :DESC).per(5)
    # 以下userコントローラからコピー
    on_numbers = @user.scores.order(id: :DESC).limit(90).map{|s|s.par_count - (s.stroke_count - s.putt_count)}
    @score = @user.round_sort.sum(:stroke_count).values.inject(:+) / @user.round_count.round(1)
    @putt = (@user.round_sort.sum(:putt_count).values.inject(:+) / @user.round_count).round(1)
    @fairway_keep_rate = (@user.scores.order(id: :DESC).limit(90).where(fairway_keep: "○").count / @user.scores.limit(90).count.to_f * 100).round(1)
    @par_on_rate = (on_numbers.count(2) / @user.scores.limit(90).count.to_f * 100).round(1)
    @under_par_on_rate = (on_numbers.count(3) / @user.scores.limit(90).count.to_f * 100).round(1)
    # グラフ表示
    @round_data = @user.rounds.map{|r| [r.play_date.to_s, r.scores.sum(:stroke_count)]}
  end

  def show
    @user = User.find(params[:user_id])
    @round = Round.find(params[:id])
    @scores = @round.scores
    # フェアウェイキープ率の計算
    @fairway_keep_rate = (@round.scores.map{|s|s.fairway_keep_before_type_cast}.sum(0.00) / @round.scores.size * 100).floor
    # パーオン率の計算
    @on_numbers = @round.on_numbers
    @under_par_on_rate = (@on_numbers.count(3) / @round.round_count * 100).floor
    @par_on_rate = (@on_numbers.count(2) / @round.round_count * 100).floor
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
