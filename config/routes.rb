Rails.application.routes.draw do
  root 'sessions#new'

  scope module: 'menus' do
    get 'menus', to: 'index#call', as: 'menus'
  end
  put 'menus/:id/publish', to: 'publish_menu#call', as: 'publish_menu'
  put 'menus/:id/close', to: 'close_menu#call', as: 'close_menu'

  resources :menus, except: [:index] do
    get 'fill', on: :member
  end

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'webhooks/orders', to: 'process_webhook_order#call'
  get 'menus/:id/orders', to: 'show_orders#call', as: 'orders'

  get 'oauth/authorize', to: 'authorize_oauth#call', as: 'oauth_authorize'
  get 'oauth/token', to: 'create_oauth_token#call', as: 'oauth_token'
end
