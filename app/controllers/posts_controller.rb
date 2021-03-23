class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # 検索機能
    @q = Post.where(user_id: current_user.followings.pluck(:follower_id)).ransack(params[:q])
    @posts = @q.result.includes(:comments, :user).order(created_at: :desc)
    unfollow_users = User.where.not(id: current_user.followings.pluck(:follower_id)).where.not(id: current_user.id)
    @near_score_user = unfollow_users.where.not(average: nil).each.min_by{|x| (x.average - current_user.average).abs} unless current_user.average == nil
    @near_start_user = unfollow_users.each.min_by{|x| (x.start_year - current_user.start_year).abs}
    @eq_area_user = unfollow_users.find_by(prefecture: current_user.prefecture)
  end

  def index_all
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:comments, :user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_back(fallback_location: root_path)
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :body)
  end

end
