class Club < ActiveRecord::Base
  attr_accessible :name, :owner
  has_many :memberships
  has_many :users, :through => :memberships
end

