Rails.application.routes.draw do
  root 'menus#index'

  resources :menus do
      put 'publish', on: :member
  end
end
