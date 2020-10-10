Rails.application.routes.draw do

  root 'home#index'

  resources :subjects
  resources :users, only: [:index, :new, :create, :show]

  # Sessions
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post 'login' => 'sessions#create'
  get "logout", to: "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
