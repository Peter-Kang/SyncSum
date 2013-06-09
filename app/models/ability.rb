class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.candidate?
      can :manage, Candidate, :user_id => user.id
      can [ :read, :create, :edit ], Question
      can :answer, Question
    elsif user.employer?
      can :read, Question
      can :create, Question
      can :prefer, Question
      can [ :edit, :destroy ], Question, :employer_id => user.employer.id
    end
  end
end
