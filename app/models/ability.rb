class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all if user.role?(:admin)

    if user.role?(:catering)
      can %i[read create update], Menu
      can %i[show update], User, id: user.id
    end

    if user.role?(:diner)
      can %i[read fill], Menu
      can %i[show update], User, id: user.id
    end
  end
end
