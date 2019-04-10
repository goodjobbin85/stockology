Rails.application.routes.draw do

  root to: "welcome#index"
  get 'search_users', to: "users#search"
  resources :users
  
end
