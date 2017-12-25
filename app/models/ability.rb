class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    admin_user_actions if user.role?(:admin)
    catering_user_actions(user) if user.role?(:catering)
    diner_user_actions(user) if user.role?(:diner)
  end

  private

  def admin_user_actions
    can :manage, :all
  end

  def catering_user_actions(user)
    can %i[read create update], Menu
    can %i[show], OrdersController
    can %i[show update], User, id: user.id
  end

  def diner_user_actions(user)
    can %i[read fill], Menu
    can %i[show update], User, id: user.id
  end
end
