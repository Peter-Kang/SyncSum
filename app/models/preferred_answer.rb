class PreferredAnswer < ActiveRecord::Base
  attr_accessible :answer_id, :employer_id

  belongs_to :answer
  belongs_to :employer
end
