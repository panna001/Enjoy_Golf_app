class Score < ApplicationRecord
  belongs_to :user
  belongs_to :round
  
  validates :hole_number, :par_count, :stroke_count, :putt_count, :fairway_keep, :ob_count, :penalty_count, :par_on, presence: tr
end
