class Position < ActiveRecord::Base
	belongs_to :employer
	belongs_to :candiate_app
	has_and_belongs_to_many :business_sectors
end
