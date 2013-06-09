class Employer < ActiveRecord::Base
  attr_accessible :name, :tagline, :search_radius, :company_size, :description, :type, :website, :primary_industry, :size, :employee_turnover, :corporate_headquarters, :international_offices, :user_attributes, :institution_type_ids, :mission_statement

  belongs_to :user, :dependent => :destroy
  has_many :positions, :dependent => :destroy
  has_many :questions, :dependent => :destroy
  has_many :preferred_answers
  has_many :answers, :through => :preferred_answers
  
  has_and_belongs_to_many :institution_types
  
  accepts_nested_attributes_for :user

  SIZE_VALUES = ["1 - 10", "10 - 50", "50 - 200", "200 - 500", "500 - 1k", "1k - 5k", "5k+"]
  SIZE_VALUES2 = [10,50,100,200,500,1000,5000]
  CORPORATE_HEADQUARTERS_VALUES = ["Domestic", "Foreign"]

  def add_answer(answer)
    self.answers << answer
  end

  def add_answer_for_question(answer)
    answered_questions.each do |question|
      if question.in_answers?(answer)
        temp = nil
        self.answers.each do |a|
          temp = a if question.in_answers?(a)
        end
        self.answers.delete(temp)
      end
    end
    self.answers << answer
  end

  def answered_questions
    self.answers.each.map { |a| a.question }
  end
end
