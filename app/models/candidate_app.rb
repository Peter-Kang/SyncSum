class CandidateApp < ActiveRecord::Base
  attr_accessible :candidate_id, :position_id
  belongs_to :candidate
  belongs_to :position
  belongs_to :candidate_app_status
end
