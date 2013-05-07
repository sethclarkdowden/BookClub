class Commenting < ActiveRecord::Base
  attr_accessible :revew_id, :user_id
  belongs_to :revew 
  belongs_to :user 
end
