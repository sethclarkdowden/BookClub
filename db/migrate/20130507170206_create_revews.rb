class CreateRevews < ActiveRecord::Migration
  def change
    create_table :revews do |t|
      t.string :content

      t.timestamps
    end
  end
end
