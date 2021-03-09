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
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id"
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followers, through: :passive_relationships, source: :following
  
  attachment :profile_image
  
  def followed_by?(user)
    passive_relationships.where(following_id: user.id).present?
  end
end
