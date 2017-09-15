class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all if user.role?(:admin)

    can [:read, :create, :update], Menu if user.role?(:catering)
    can [:read, :fill], Menu if user.role?(:diner)

  end
end
