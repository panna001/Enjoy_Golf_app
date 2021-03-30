class Round < ApplicationRecord
  belongs_to :user

  validates :play_date, :place, presence: true

end
