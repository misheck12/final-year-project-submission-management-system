class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.faculty?
      can :manage, :all
    elsif user.student?
      can :manage, Project, user_id: user.id
      can :manage, Task, project: { user_id: user.id }
    else
      # Guest user can't do anything
    end
  end
end
