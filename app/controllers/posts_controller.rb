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
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
    post = Post.find(params[:id])
    post.user_id.current_user.id
    if post.update(post_params)
      redirect_to post_path(post)
    else
      render :edit
    end
  end
  
  def update
    
  end
  
  private
  def post_params
    params.require(:post).permit(:post_image, :body)
  end
  
end
