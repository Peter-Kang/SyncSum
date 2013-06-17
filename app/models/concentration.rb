class Concentration < ActiveRecord::Base
	has_and_belongs_to_many :business_sectors
	has_many :educations, :dependent => :destroy
end
