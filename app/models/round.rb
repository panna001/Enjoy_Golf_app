class Round < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy

  # ネスト要素保存のための記述
  accepts_nested_attributes_for :scores

  validates :play_date, :place, presence: true

  def fairway_keep_rate
    self.scores.map{|s|s.fairway_keep_before_type_cast}.sum(0.00) / self.scores.size * 100
  end

  def on_numbers
    self.scores.map{|s|s.par_count - (s.stroke_count - s.putt_count)}
  end

  def get_on_rate(i)
    self.scores.map{|s|s.par_count - (s.stroke_count - s.putt_count)}.count(1) / self.scores.size.to_f * 100
  end

  def get_sum_score(range, column)
    self.scores.slice(range).pluck(column).sum
  end

end
