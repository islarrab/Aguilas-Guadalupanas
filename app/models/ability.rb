class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.coordinator?
      can :read, Project
      can [:new, :edit, :update, :destroy], Activity, :project => { :coordinator_id => user.id }
      can :read, Activity
    elsif !user.id.nil?
      can :read, Project
      can :read, Activity
    else
      can :read, Project
    end
  end
end

