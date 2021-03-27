class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.references :user, foreign_key: true
      t.date :play_date
      t.string :place
      t.string :weather
      t.string :wind
      t.integer :stroke_count
      t.integer :putt_count
      t.integer :par_on
      t.integer :fairway_keep
      t.integer :ob_count
      t.integer :penalty_count
      t.timestamps
    end
  end
end
