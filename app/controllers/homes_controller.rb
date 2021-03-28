class HomesController < ApplicationController
  def top
  end

  def about
    @new_posts = Post.all.order(id: :desc).first(3)
    @favorite_posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @ranking_men = User.where.not(average: nil).where(sex: 1).order(average: :asc).first(3)
    @ranking_women = User.where.not(average: nil).where(sex: 2).order(average: :asc).first(3)
  end
end
