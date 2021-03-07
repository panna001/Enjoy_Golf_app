class PostsController < ApplicationController
  def index
  end

  def show
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
    post = Post.find(params[:id])
    if post = current_user.posts.update(post_params)
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
