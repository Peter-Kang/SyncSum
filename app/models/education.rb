class Education < ActiveRecord::Base
  attr_accessible :school_id, :degree_id, :concentration_id, :gpa, :honors, :ranking, :school_name

  belongs_to :candidate
  belongs_to :school
  belongs_to :degree
  belongs_to :concentration

  validates :candidate,     presence: true
  validates :school,        presence: true
  validates :degree,        presence: true
  validates :concentration, presence: true

  def school_name
    school.try(:name)
  end

  def school_name=(name)
    self.school = School.find_by_name(name) if name.present?
  end
end
