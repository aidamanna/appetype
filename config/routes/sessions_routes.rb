module SessionsRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'sessions' do
        root 'new#call'
        get 'login', to: 'new#call'
        post 'login', to: 'create#call'
        delete 'logout', to: 'destroy#call'
      end
    end
  end
end
