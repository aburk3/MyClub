Rails.application.routes.draw do
  resources :users
  resources :clubs do
    resources :meetings, only: [:show, :index]
  end

  resources :meetings, only: [:index, :show, :new, :create, :edit, :update]

  root "sessions#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/join", to: "users#join"
  get "/signout", to: "sessions#destroy"
  post "/leave", to: "users#leave"
  get '/auth/facebook/callback' => 'sessions#create'
end
