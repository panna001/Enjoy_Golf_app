class Round < ApplicationRecord
  belongs_to :user
  
  validates :date, :place, presence: true
end
