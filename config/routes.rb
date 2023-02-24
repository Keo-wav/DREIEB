Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :drugs, only: %I[index show new create edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
