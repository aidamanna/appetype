Rails.application.routes.draw do
  root 'sessions#new'

  put 'menus/:id/publish', to: 'publish_menu#invoke', as: 'publish_menu'

  resources :menus do
    get 'fill', on: :member
    put 'close', on: :member
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'webhooks/orders', to: 'webhook_orders#create'
  get 'menus/:id/orders', to: 'menu_orders#show', as: 'menu_orders'
end
