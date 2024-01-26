Rails.application.routes.draw do
  root to: "furimas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :furimas do
  end
  # Defines the root path route ("/")
  
end
