class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy

  # ネスト要素保存のための記述
  accepts_nested_attributes_for :scores

  validates :play_date, :place, presence: true

  def fairway_count
    self.scores.map{|s|s.fairway_keep_before_type_cast.sum(0.00)}
  end

  def on_numbers
    self.scores.map{|s|s.par_count - (s.stroke_count - s.putt_count)}
  end

  # ％計算時の分母　ラウンド回数
  def round_count
    self.scores.size.to_f
  end
end
