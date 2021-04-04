class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only:[:index, :show, :all, :bookmarks]

  def index
    # 検索機能
    @q = Post.where(user_id: current_user.followings.pluck(:follower_id).push(current_user.id)).ransack(params[:q])
    @posts = @q.result.includes(:comments, :user).order(created_at: :desc)
    # おすすめ機能
    unfollow_users = User.where.not(id: current_user.followings.pluck(:follower_id)).where.not(id: current_user.id)
    @near_score_user = unfollow_users.where.not(average: nil).each.min_by{|x| (x.average - current_user.average).abs} unless current_user.average == nil
    @near_start_user = unfollow_users.each.min_by{|x| (x.start_year - current_user.start_year).abs}
    @eq_area_user = unfollow_users.find_by(prefecture: current_user.prefecture)
  end

  def all
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
    tags = Vision.get_image_data(post.post_image)
    tags.each do |tag|
      post.tags.create(name: tag)
      
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
    if params[:key] == "show"
      redirect_to user_path current_user
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.order("bookmarks.created_at desc")
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :body)
  end

# コメント用
  def set_comment
    @comment = Comment.new
  end

end
