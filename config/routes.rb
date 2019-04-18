Rails.application.routes.draw do

  root to: "welcome#index"
  get 'search_users', to: "users#search"
  resources :users
  
  get '/list_stocks', to: "stocks#list_stock"
  get 'search_stocks', to: "stocks#search"
  get 'portfolio', to: "users#portfolio"
  
end
