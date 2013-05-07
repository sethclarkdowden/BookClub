class CreateCommentings < ActiveRecord::Migration
  def change
    create_table :commentings do |t|
      t.integer :user_id
      t.integer :revew_id

      t.timestamps
    end
  end
end
