class Review < ActiveRecord::Base
  attr_accessible :book_id, :chapter_id, :club_id, :content, :user_id
  belongs_to :user
  belongs_to :chapter
  belongs_to :club
  belongs_to :book
  has_many :comments
end
