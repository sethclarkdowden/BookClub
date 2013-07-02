class Rating < ActiveRecord::Base
  attr_accessible :ISBN, :rating, :user_id
end
