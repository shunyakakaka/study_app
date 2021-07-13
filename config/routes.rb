Rails.application.routes.draw do
  root "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users
  resources :records
end
