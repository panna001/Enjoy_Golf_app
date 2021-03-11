class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :scores
  
  validates :date, :place, presence: true
end
