class BookmarksController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.new(post_id: params[:post_id])
    bookmark.save
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    bookmark = current_user.bookmarks.find_by(post_id: params[:post_id])
    bookmark.destroy
  end
end
