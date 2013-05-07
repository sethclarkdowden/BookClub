class CreateRevewings < ActiveRecord::Migration
  def change
    create_table :revewings do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :club_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
