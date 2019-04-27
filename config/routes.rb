Rails.application.routes.draw do

  get 'signup', to: "users#new"
  get 'login', to: "sessions#new", as: "login"
  post 'login', to: "sessions#create" 
  get 'logout', to: "sessions#destroy", as: "logout"

  get 'sessions/create'

  get 'sessions/destroy'

  root to: "welcome#index"
  get 'search_users', to: "users#search"
  resources :users
  
  get '/list_stocks', to: "stocks#list_stock"
  get 'search_stocks', to: "stocks#search"
  get 'portfolio', to: "users#portfolio"
  
end
