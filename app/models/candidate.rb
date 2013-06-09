class Candidate < ActiveRecord::Base
  attr_accessible :search_radius, :first_name, :last_name, :employment_status,
                  :min_company_search_size, :max_company_search_size,
                  :user_attributes, :educations_attributes, :resume

  belongs_to :user, :dependent => :destroy
  
  has_many :experiences, :dependent => :destroy  
  has_many :educations, :dependent => :destroy
  has_many :degrees, :through => :educations
  has_many :concentrations, :through => :educations
  
  has_many :candidate_apps, :dependent => :destroy

  has_and_belongs_to_many :certifications
  has_and_belongs_to_many :answers
  
  has_attached_file :resume
  
  accepts_nested_attributes_for :user, :educations

  def full_name
    (first_name.nil? or last_name.nil?) ? "(Empty Name)" : "#{first_name} #{last_name}"
  end

  def employment_status
    read_attribute(:employment_status).blank? ? "(Empty Employment Status)" : read_attribute(:employment_status)
  end

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
