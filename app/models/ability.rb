class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.coordinator?
      can :manage, Project
      can :manage, Activity, :project => { :user_id => user.id }
    else
      can :read, Project
      can :read, Activity
    end
  end
end

