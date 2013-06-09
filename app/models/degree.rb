class Degree < ActiveRecord::Base
  has_many :educations, :dependent => :destroy
  has_many :candidates, :through => :educations
end
