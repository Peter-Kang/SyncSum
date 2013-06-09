class School < ActiveRecord::Base
  attr_accessible :name, :city, :state

  has_many :candidates_concentrations_degrees
  has_many :candidates, through: :candidates_concentrations_degrees
end
