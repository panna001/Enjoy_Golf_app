class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: params[:post_id])
    favorite.save
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(post_id: params[:post_id])
    favorite.destroy
  end
end
