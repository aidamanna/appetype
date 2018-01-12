module OauthRoutes
  def self.extended(router)
    router.instance_exec do
      scope module: 'oauth' do
        get 'oauth/authorize', to: 'authorize_user#call', as: 'oauth_authorize'
        get 'oauth/token', to: 'create_token#call', as: 'oauth_token'
      end
    end
  end
end
