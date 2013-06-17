class Experience < ActiveRecord::Base
  attr_accessible :company, :title, :start, :end, :job_function_ids, :business_sector_ids
  
  belongs_to :candidate
  has_and_belongs_to_many :job_functions
  has_and_belongs_to_many :business_sectors

  accepts_nested_attributes_for :job_functions
  accepts_nested_attributes_for :business_sectors

  default_scope order('created_at desc')

  validates :company, presence: true
  validates :title,   presence: true
  validates :start,   presence: true
  validates :end,     presence: true

  validate :validate_too_many_business_sectors
  validate :validate_not_enough_business_sectors
  validate :validate_too_many_job_functions
  validate :validate_not_enough_job_functions

  MAX_BUSINESS_SECTORS = 3
  MIN_BUSINESS_SECTORS = 1
  MAX_JOB_FUNCTIONS = 3
  MIN_JOB_FUNCTIONS = 1

  def validate_too_many_business_sectors
    errors.add :base, "Too many industries (up to 3)" if business_sectors.length > MAX_BUSINESS_SECTORS
  end

  def validate_not_enough_business_sectors
    errors.add :base, "Specify at least one industry" if business_sectors.length < MIN_BUSINESS_SECTORS
  end

  def validate_too_many_job_functions
    errors.add :base, "Too many job functions (up to 3)" if job_functions.length > MAX_JOB_FUNCTIONS
  end

  def validate_not_enough_job_functions
    errors.add :base, "Specify at least one job function" if job_functions.length < MIN_JOB_FUNCTIONS
  end
end
