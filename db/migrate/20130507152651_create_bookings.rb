class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :book_id
      t.integer :club_id

      t.timestamps
    end
  end
end
