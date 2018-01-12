module UsersRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'users' do
        get 'users/invite', to: 'new_invite#call', as: 'new_user_invitation'
        post 'users/invite', to: 'create_invite#call', as: 'create_user_invitation'
        get 'signup', to: 'new#call'
        post 'users', to: 'create#call'
      end

      resources :users, except: %i[new create]
    end
  end
end