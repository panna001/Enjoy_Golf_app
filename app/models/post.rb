class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  attachment :post_image
  validates :body, presence: true
  
  def favorited_by?(user)
    favorites.find_by(user_id: user.id).present?
  end
  
  def bookmarked_by?(user)
    bookmarks.find_by(user_id: user.id).present?
  end
  
  def followed_by?(user)
    passive_relationships.find_by(follower_id: user.id).present?
  end
end
