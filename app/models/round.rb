class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy
  
  # ネスト要素保存のための記述
  accepts_nested_attributes_for :scores
  
  validates :play_date, :place, presence: true
  

  
  # 計算用メソッド　うまくいかず
  # def score_result(result)
  #   case result
  #   when -3
  #     "-3"
  #   when -2
  #     "◎"
  #   when -1
  #     "○"
  #   when 0
  #     "-"
  #   when 1
  #     "△"
  #   when 2
  #     "□"
  #   when 3
  #     "+3"
  #   end
  # end
  
  # def sum_fairway
  #   self.scores.sum(:fairway_keep)
  # end
  # def count_hole
  #   self.scores.count
  # end
end
