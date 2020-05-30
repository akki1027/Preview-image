class CreatePostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos do |t|
      t.integer :user_id
      t.string :photo_id
      t.string :location
      t.text :caption

      t.timestamps
    end
  end
end
