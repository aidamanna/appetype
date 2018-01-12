module SessionsRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'sessions' do
        get 'login', to: 'new#call'
        delete 'logout', to: 'destroy#call'
      end
      post 'login', to: 'sessions#create'
    end
  end
end
