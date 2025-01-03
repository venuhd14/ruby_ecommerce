Rails.application.routes.draw do
  resource :cart, only: [:show] do
    post 'add', to: 'carts#add'
  end

  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create, :show]

  devise_for :users

  root "home#index"
end
