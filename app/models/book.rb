class Book < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters
  has_many :bookings
  has_many :clubs, :through => :bookings
  has_many :revewings
  has_many :revews, :through => :revewings
end
