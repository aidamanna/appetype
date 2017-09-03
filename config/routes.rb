Rails.application.routes.draw do
  root 'sessions#new'

  resources :menus do
    put 'publish', on: :member
    get 'fill', on: :member
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
