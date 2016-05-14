Rails.application.routes.draw do

  root 'sessions#new'

  resources :sessions, only: [:create]
  get "login" => 'sessions#new', :as => "login"
  get "logout" => 'sessions#destroy', :as => "logout"

  resources :users, only:[:new, :create]
  resources :users, only: [:show] do
    resources :rounds, only: [:index]
    resources :decks, only: [:index]
  end

  resources :rounds, only: [:new]
  resources :rounds, only: [:show] do
    resources :photos, only: [:index, :show, :create]
    resources :prompts, only: [:show]
  end

end
