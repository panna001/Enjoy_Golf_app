class Score < ApplicationRecord
  belongs_to :round

  # validates :hole_number, :par_count, :stroke_count, :putt_count, :fairway_keep, :ob_count, :penalty_count, :par_on, presence: true

  enum fairway_keep:{
    ○:1,×:0
  }
end
