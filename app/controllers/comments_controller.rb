class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    if @comment.save
      # 通知機能
      @comment.post.create_notification_comment!(current_user, @comment.id)
    else
      render :index
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    unless @comment.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    comment = current_user.comments.find_by(post_id: params[:post_id])
    if comment.update(comment_params)
      redirect_to post_path(comment.post)
    else
      render :new
    end
  end

  def destroy
    @comment = current_user.comments.find_by(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
