class User < ActiveRecord::Base
  attr_accessible :name
  has_many :memberships
  has_many :clubs, 		:through => :memberships
  has_many :reviews
end
