module UsersRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'users' do
        get 'users/invite', to: 'new_invite#call', as: 'new_user_invitation'
        post 'users/invite', to: 'create_invite#call', as: 'create_user_invitation'
        get 'users/index', to: 'index#call', as: 'users'
        get 'signup', to: 'new#call'
        post 'users', to: 'create#call', as: 'create_user'
        get 'users/:id', to: 'show#call', as: 'user'
        get 'users/:id/edit', to: 'edit#call', as: 'edit_user'
        put 'users/:id', to: 'update#call'
        delete 'users/:id', to: 'destroy#call'
      end
    end
  end
end
