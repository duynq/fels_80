Rails.application.routes.draw do
  root "static_pages#home"

  get "categories" => "categories#index"
  get "help" => "static_pages#help"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :lessons
  resources :categories
  resources :words
  resources :relationships

  namespace :admin do
    root "categories#index"
    resources :categories
  end
end
