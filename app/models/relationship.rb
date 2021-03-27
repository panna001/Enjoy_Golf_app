class Relationship < ApplicationRecord
  belongs_to :following , class_name: "User"
  belongs_to :follower, class_name: "User"

  # 通知機能
  def create_notification_follow!(current_user, target_user_id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", follower_id, target_user_id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: follower_id,
        action: 'follow'
      )
    end
    notification.save if notification.valid?
  end
end
