class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
  
  # ネスト要素保存のための記述
  accepts_nested_attributes_for :scores
  
  # validates :play_date, :place, presence: true
end
