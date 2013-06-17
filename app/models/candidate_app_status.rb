class CandidateAppStatus < ActiveRecord::Base
  has_many :candidate_app
  attr_accessible :name
end
