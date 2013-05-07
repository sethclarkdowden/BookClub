class User < ActiveRecord::Base
  attr_accessible :name
  has_many :memberships
  has_many :clubs, 		:through => :memberships
  has_many :revewings
  has_many :revews, 	:through => :revewings, :source => :user 
  has_many :commentings
  has_many :comments, 	:through => :commentings
end
