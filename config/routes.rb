Rails.application.routes.draw do

  root 'home#index'

  resources :subjects do
    resources :exams, only: [:new, :create]
  end

  resources :users, only: [:index, :new, :create] do
    member do
      get :confirm_email
    end
  end

  get "not_passed", to: 'exams#index', as: "exams"

  # Sessions
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post 'login' => 'sessions#create'
  get "logout", to: "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
