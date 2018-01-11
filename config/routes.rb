Rails.application.routes.draw do
  root 'sessions#new'

  scope module: 'menus' do
    get 'menus', to: 'index#call', as: 'menus'
    get 'menus/new', to: 'new#call', as: 'new_menu'
    post 'menus', to: 'create#call'
    get 'menus/:id', to: 'show#call', as: 'menu'
    get 'menus/:id/edit', to: 'edit#call', as: 'edit_menu'
    put 'menus/:id/close', to: 'close#call', as: 'close_menu'
    put 'menus/:id/publish', to: 'publish#call', as: 'publish_menu'
  end

  resources :menus, except: %i[index new create show edit] do
    get 'fill', on: :member
  end

  scope module: 'users' do
    get 'users/invite', to: 'new_invite#call', as: 'new_user_invitation'
    post 'users/invite', to: 'create_invite#call', as: 'create_user_invitation'
    get 'signup', to: 'new#call'
    post 'users', to: 'create#call'
  end

  resources :users, except: %i[new create]

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
