Rails.application.routes.draw do

  get 'user_stocks/create'

  get 'user_stocks/destroy'

  get 'signup', to: "users#new"
  get 'login', to: "sessions#new", as: "login"
  post 'login', to: "sessions#create" 
  get 'logout', to: "sessions#destroy", as: "logout"

  root to: "welcome#index"

  resources :users do 
    resources :stocks
  end
  
  get 'search_stocks', to: "stocks#search"
  get 'portfolio', to: "users#portfolio"
  
end
