Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :drugs do
    resources :orders, except: :show
  end
  resources :orders, only: :show
  patch 'orders/:id/approve', to: 'orders#approve'
  patch 'orders/:id/decline', to: 'orders#decline'
  get 'users/:id/my_orders', to: 'orders#my_orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
