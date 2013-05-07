class Chapter < ActiveRecord::Base
  attr_accessible :book_id, :title
  belongs_to :book
  has_many :revewings
  has_many :revews, :through => :revewings
end
