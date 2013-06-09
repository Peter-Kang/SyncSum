class BusinessSector < ActiveRecord::Base
	has_and_belongs_to_many :concentrations
	has_and_belongs_to_many :positions
  has_and_belongs_to_many :experiences
end
