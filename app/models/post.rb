class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  validates :body, :post_image, presence: true
  attachment :post_image
  
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
