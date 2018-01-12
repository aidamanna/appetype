module SessionsRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'sessions' do
        delete 'logout', to: 'destroy#call'
      end
      get 'login', to: 'sessions#new'
      post 'login', to: 'sessions#create'
    end
  end
end
