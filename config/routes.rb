Rails.application.routes.draw do
  root "static_pages#home"

  get "categories" => "categories#index"
  get "help" => "static_pages#help"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :categories
  resources :words
  resources :relationships
end
