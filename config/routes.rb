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

  scope module: 'users' do
    get 'users/invite', to: 'new_invite#call', as: 'new_user_invitation'
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  scope module: 'orders' do
    post 'webhooks/orders', to: 'process_webhook#call'
    get 'menus/:id/orders', to: 'show#call', as: 'orders'
  end

  scope module: 'oauth' do
    get 'oauth/authorize', to: 'authorize_user#call', as: 'oauth_authorize'
    get 'oauth/token', to: 'create_token#call', as: 'oauth_token'
  end
end
