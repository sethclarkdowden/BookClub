class Revewing < ActiveRecord::Base
  attr_accessible :book_id, :chapter_id, :club_id, :user_id
  belongs_to :user
  belongs_to :chapter 
  belongs_to :club 
  belongs_to :book 
end
