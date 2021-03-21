class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    # 通知機能
    follow.create_notification_follow!(current_user)
    # 非同期にしたい
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    # 非同期にしたい
    redirect_back(fallback_location: root_path)
  end

end
