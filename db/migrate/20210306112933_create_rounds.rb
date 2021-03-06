class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.string :place
      t.string :weather
      t.stirng :wind

      t.timestamps
    end
  end
end
