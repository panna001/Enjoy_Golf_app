class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :round, foreign_key: true
      t.integer :hole_number
      t.integer :par_count
      t.integer :stroke_count
      t.integer :putt_count
      t.integer :fairway_keep
      t.integer :ob_count
      t.integer :penalty_count
      t.integer :par_on

      t.timestamps
    end
  end
end
