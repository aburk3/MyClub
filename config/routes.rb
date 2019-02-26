Rails.application.routes.draw do
  root "users#signin"
  resources :users

end
