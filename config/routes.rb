Rails.application.routes.draw do

  get "get_user_id" => 'sessions#get_user_id', :as => "get_user_id"
  resources :sessions, only: [:create]
  resources :decks, only: [:index]
  resources :photos, only: [:show, :create]

  resources :users, only:[:create, :show] do
    resources :rounds, only: [:index]
  end

  resources :rounds, only: [:create] do
    resources :photos, only: [:index]
  end

end
