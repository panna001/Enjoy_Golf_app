class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  attachment :post_image
  validates :body, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
