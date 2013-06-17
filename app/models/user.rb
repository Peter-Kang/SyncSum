class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :avatar, :phone, :registration_date, :street,
                  :city, :apt, :state, :zip, :country, :unconfirmed_email,
                  :website, :latitude, :longitude, :candidate_attributes,
                  :employer_attributes, :login
  attr_accessor :login
  
  has_many :messages
  has_one :candidate, :dependent => :destroy
  has_one :employer,  :dependent => :destroy

  accepts_nested_attributes_for :candidate, :employer
  
  after_validation :geocode
  
  #paperclip stuff
  has_attached_file :avatar,
                    :styles => { :medium => "200x200#", :thumb => "50x50#" },
                    :default_url => 'placeholder.jpg'
  
  #geocode stuff
  geocoded_by :address, :if => :address_changed?

  def isAdmin
    employer? && self.email.match("admin@%") 
  end

  def address
    if street.blank? and city.blank? and state.blank?
      "(Empty Address)"
    elsif street.blank? and city.blank?
      "#{state}"
    elsif street.blank? and state.blank?
      "#{city}"
    elsif city.blank? and state.blank?
      "#{street}"
    elsif street.blank?
      "#{city}, #{state}"
    elsif city.blank?
      "#{street}, #{state}"
    elsif state.blank?
      "#{street}, #{city}"
    end
  end

  def candidate?
    self.employer.nil?
  end

  def employer?
    self.candidate.nil?
  end

  def type_object
    candidate? ? self.candidate : self.employer
  end

  def singular_type
    candidate? ? "candidate" : "employer"
  end

  def plural_type
    "#{singular_type}s"
  end

  def answered_questions
    self.candidate? ? self.candidate.answered_questions : self.employer.answered_questions
  end

  def username
    self.email
  end

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

end
