class Importance < ActiveRecord::Base
  attr_accessible :level

  has_many :questions
end
