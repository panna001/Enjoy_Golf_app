class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = current_user.posts.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post)
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
