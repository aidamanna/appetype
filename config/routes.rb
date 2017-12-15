Rails.application.routes.draw do
  root 'sessions#new'

  put 'menus/:id/publish', to: 'publish_menu#invoke', as: 'publish_menu'

  resources :menus do
    get 'fill', on: :member
    put 'close', on: :member
  end

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'webhooks/orders', to: 'webhook_orders#create'
  get 'menus/:id/orders', to: 'menu_orders#show', as: 'menu_orders'

  get 'oauth/authorize', to: 'oauth_authorize#call', as: 'oauth_authorize'
  get 'oauth/token', to: 'oauth_token#call', as: 'oauth_token'
end
