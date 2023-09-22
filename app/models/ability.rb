class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    elsif user.faculty?
      can :manage, Project
      can :manage, Task
      can :manage, Team
    elsif user.staff?
      can [:read, :create, :update], Project
      can [:read, :update, :create], Task
      can :read, Team
    elsif user.student?
      can [:read, :update, :create, :destroy], Project, user_id: user.id
      can [:read, :update], Task, project: { user_id: user.id }
    else
      # Guest user can't do anything
    end
  end
end
