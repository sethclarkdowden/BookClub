class Comment < ActiveRecord::Base
  attr_accessible :comment
  has_many :commentings
  has_many :users, 	:through => :commentings
  has_many :revews, :throuth => :commentings
end
