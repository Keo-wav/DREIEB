Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :drugs do
    resources :orders, except: [:show, :destroy]
  end
  resources :orders, only: [:show, :destroy]
  patch 'orders/:id/approve', to: 'orders#approve', as: 'approve'
  patch 'orders/:id/decline', to: 'orders#decline', as: 'decline'
  get 'users/:id/my_orders', to: 'orders#my_orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
