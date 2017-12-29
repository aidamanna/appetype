Rails.application.routes.draw do
  root 'sessions#new'

  scope module: 'menus' do
    get 'menus', to: 'index#call', as: 'menus'
    put 'menus/:id/close', to: 'close#call', as: 'close_menu'
    put 'menus/:id/publish', to: 'publish#call', as: 'publish_menu'
  end

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
