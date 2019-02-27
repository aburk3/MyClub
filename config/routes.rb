Rails.application.routes.draw do
  resources :users
  resources :clubs
  root "sessions#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/join", to: "users#join"
end
