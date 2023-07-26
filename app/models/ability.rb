class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    elsif user.faculty?
      can :read, :all
      can :create, Comment
      can [:update, :destroy], Comment, user_id: user.id
      can :manage, [Project, Task]
      cannot :manage, User
    elsif user.staff?
      can :read, :all
      can :manage, [Project, Task, Resource]
      cannot :manage, User
    elsif user.student?
      can :read, :all
      can :manage, Comment, user_id: user.id
      can :manage, Project, user_id: user.id
      can :manage, Task, user_id: user.id
      cannot :manage, User
    else
      # Guest user permissions
    end
  end
end
