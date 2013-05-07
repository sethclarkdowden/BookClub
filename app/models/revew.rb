class Revew < ActiveRecord::Base
  attr_accessible :content
  has_many :revewings
  has_many :books, 		:through => :revewings
  has_many :chapters, 	:through => :revewings
  has_many :users, 		:through => :revewings
  has_many :clubs, 		:through => :revewings
end
