class Club < ActiveRecord::Base
  attr_accessible :name, :owner
  has_many :memberships
  has_many :users, 	:through => :memberships
  has_many :bookings
  has_many :books, 	:through => :bookings
  has_many :revewings
  has_many :revews, :through => :revewings
end

