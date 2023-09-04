class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    elsif user.faculty
      can :manage, :Task
      can :manage, :Team
      can :manage, :project
      can :manage, :staff
    elsif user.staff?
      can [:read, :create, :update], Project
      can :read, Task
      can :read, Team
    elsif user.student?
      can [:read, :update, :create, :destroy], Project, user_id: user.id
      can [:read, :create, :destroy], Task, project: { user_id: user.id }
    else
      # Guest user can't do anything
    end
  end
end
