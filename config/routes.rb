Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :items, only: [:index, :show] 

  resources :furimas do
    resources :orders, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
  
end
