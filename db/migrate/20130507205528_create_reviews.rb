class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :club_id
      t.integer :chapter_id
      t.string :content

      t.timestamps
    end
  end
end
