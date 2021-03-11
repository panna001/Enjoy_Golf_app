class Score < ApplicationRecord
  belongs_to :round
  
  # validates :hole_number, :par_count, :stroke_count, :putt_count, :fairway_keep, :ob_count, :penalty_count, :par_on, presence: true

  # def par_on_check
  #   if stroke_count - 2 == par_count
  #     1
  #   else
  #     0
  #   end
  # end
  
  enum fairway_keep:{
    ○:1,×:2
  }
end
