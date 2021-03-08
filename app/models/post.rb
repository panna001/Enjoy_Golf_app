class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  attachment :post_image
  validates :body, presence: true
end
