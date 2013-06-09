class Answer < ActiveRecord::Base
  attr_accessible :answer, :question_id

  belongs_to :question
  has_many :preferred_answers
  has_many :employers, :through => :preferred_answer
  has_and_belongs_to_many :candidates
  
  def self.from_question(question)
    where('question_id = ?', question.id)
  end
end
