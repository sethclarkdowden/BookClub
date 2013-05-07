class Chapter < ActiveRecord::Base
  attr_accessible :number, :title
  belongs_to :book
end
