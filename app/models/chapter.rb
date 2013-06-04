class Chapter < ActiveRecord::Base
  attr_accessible :book_id, :title
  belongs_to :book
end
