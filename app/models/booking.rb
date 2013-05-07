class Booking < ActiveRecord::Base
  attr_accessible :book_id, :club_id
  belongs_to :book
  belongs_to :club
end
