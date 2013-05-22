class User < ActiveRecord::Base
  attr_accessible :access_token, :expires, :name, :provider, :refresh_token, :uid, :scope

  validates_uniqueness_of :uid, :scope => :provider
  
  has_many :memberships
  has_many :clubs, :through => :memberships
  has_many :reviews
end
