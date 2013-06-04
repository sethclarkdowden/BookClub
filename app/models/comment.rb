class Comment < ActiveRecord::Base
  attr_accessible :comment, :review_id, :user_id
  belongs_to :user
end
