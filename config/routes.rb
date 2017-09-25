Rails.application.routes.draw do
  root 'sessions#new'

  resources :menus do
    put 'publish', on: :member
    get 'fill', on: :member
    put 'close', on: :member
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'webhooks/orders', to: 'webhook_orders#create'
  get 'menus/:id/orders', to: 'menu_orders#show'
end
