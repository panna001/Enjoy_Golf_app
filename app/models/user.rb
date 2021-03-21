class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  # フォロー・フォロワー
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following
  has_many :rounds, dependent: :destroy
  # 直接値をとるためにスルーを指定
  has_many :scores, through: :rounds

  # 通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  validates :account_name, :first_name, :last_name, :sex, :prefecture, :teens, presence: true
  validates :account_name, uniqueness: true
  validates :introduction, length: { maximum: 100}


  # 住所選択用
  enum prefecture:{
     "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }


  attachment :profile_image

# ユーザー情報関連
  # 経験年数計算
  def experience_year
    year = Date.today.year - start_year
    month = Date.today.month - start_month
    if month < 0
      year -= 1
    end
    return year
  end

  # 経験月数計算
  def experience_month
    month = Date.today.month - start_month
    if month < 0
      month += 12
    end
    return month
  end

# フォロー済み確認
  def followed_by?(user)
    passive_relationships.where(following_id: user.id).present?
  end

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

  # スコア関連情報取得
  def get_average_score(column)
    self.scores.order(id: :DESC).limit(5).group(:round_id).sum(column).values.inject(:+) / self.rounds.limit(5).count.to_f.round(1)
  end

  def get_on_rate(i)
    self.scores.order(id: :DESC).limit(90).map{|s|s.par_count - (s.stroke_count - s.putt_count)}.count(i) / self.scores.limit(90).count.to_f * 100
  end

  def get_fairway_keep_rate
    self.scores.order(id: :DESC).limit(90).pluck(:fairway_keep).count("○") / self.scores.limit(90).count.to_f * 100
  end

  # ランク判定
  def rank_check
    score = self.get_average_score(:stroke_count)
    if score < 72
      rank = "S"
    elsif score < 81
      rank = "A+"
    elsif score < 90
      rank = "A-"
    elsif score < 99
      rank = "B+"
    elsif score < 108
      rank = "B-"
    elsif score < 117
      rank = "C+"
    elsif score < 126
      rank = "C-"
    elsif score < 135
      rank = "D+"
    elsif score < 144
      rank = "D-"
    else
      rank = "E"
    end
    return  rank
  end

end
