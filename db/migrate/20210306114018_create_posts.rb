class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.string :post_image_id

      t.timestamps
    end
  end
end
