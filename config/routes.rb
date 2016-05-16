Rails.application.routes.draw do

  resources :sessions, only: [:create]
  resources :decks, only: [:index]
  resources :photos, only: [:show, :create]

  resources :users, only:[:create, :show] do
    resources :rounds, only: [:index]
  end

  resources :rounds, only: [:create]
  resources :rounds, only: [:show] do
    resources :photos, only: [:index]
  end

end
