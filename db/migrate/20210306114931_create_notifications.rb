class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :post, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :action
      t.boolian :checked

      t.timestamps
    end
  end
end
