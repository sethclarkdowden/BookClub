class Revewing < ActiveRecord::Base
  attr_accessible :book_id, :chapter_id, :club_id, :user_id
  belongs_to :user, :optional => true
  belongs_to :chapter, :optional => true 
  belongs_to :club, :optional => true
  belongs_to :book, :optional => true
end
