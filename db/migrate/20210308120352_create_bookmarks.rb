class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true

      t.timestamps
    end
  end
end
