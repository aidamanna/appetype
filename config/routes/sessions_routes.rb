module SessionsRoutes
  def self.extended(router)
    router.instance_exec do
      get 'login', to: 'sessions#new'
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end
  end
end
