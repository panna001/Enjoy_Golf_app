class Relationship < ApplicationRecord
  belongs_to :following , class_name: "User"
  belongs_to :follower, class_name: "User"

  # 通知機能
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
    end
    notification.save if notification.valid?
  end
end
