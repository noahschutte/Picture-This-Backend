Rails.application.routes.draw do

  root 'sessions#new'

  resources :sessions, only: [:create]
  get "login" => 'sessions#new', :as => "login"
  get "logout" => 'sessions#destroy', :as => "logout"

  resources :users, only:[:new, :create, :show] do
    resources :rounds, only: [:index]
  end

  resources :decks, only: [:index]
  resources :photos, only: [:show, :create]
  resources :rounds, only: [:new, :create]

  resources :rounds, only: [:show] do
    resources :photos, only: [:index]
  end

end
