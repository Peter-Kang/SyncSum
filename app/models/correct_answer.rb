class CorrectAnswer < ActiveRecord::Base
	belongs_to :employer
	belongs_to :question
	belongs_to :question_answer
end
