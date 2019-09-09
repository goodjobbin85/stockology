Rails.application.routes.draw do


  get 'signup', to: "users#new"
  get 'login', to: "sessions#new", as: "login"
  post 'login', to: "sessions#create" 
  get 'logout', to: "sessions#destroy", as: "logout"

  root to: "welcome#index"

  resources :user_stocks, only: [:create, :destroy]
  resources :users 
  resources :friendships
  
  get 'my_friends', to: "users#my_friends"
  get 'search_stocks', to: "stocks#search"
  get 'portfolio', to: "users#portfolio"
  
end
