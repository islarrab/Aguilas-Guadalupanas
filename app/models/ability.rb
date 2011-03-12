class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.coordinator?
      can :manage, Project, :user_id => user.id
    else

    end
  end
end

