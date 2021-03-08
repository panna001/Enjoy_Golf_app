class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end
  
  def create
    comment = current_user.comments.new(comment_params)
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_path(comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
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
    comment = current_user.comments.find_by(post_id: params[:post_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
