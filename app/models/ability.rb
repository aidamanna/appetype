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
    can :call, Menus::IndexController
    can :call, Menus::ShowController
    can :call, Menus::NewController
    can :call, Menus::CreateController
    can :call, Menus::EditController
    can :call, Menus::UpdateController
    can :call, Orders::ShowController
    can :call, Users::IndexController, id: user.id
    can :call, Users::ShowController, id: user.id
    can :call, Users::EditController, id: user.id
    can :call, Users::UpdateController, id: user.id
  end

  def diner_user_actions(user)
    can :call, Menus::IndexController
    can :call, Menus::ShowController
    can :call, Menus::FillController
    can :call, Users::IndexController, id: user.id
    can :call, Users::ShowController, id: user.id
    can :call, Users::EditController, id: user.id
    can :call, Users::UpdateController, id: user.id
  end
end
