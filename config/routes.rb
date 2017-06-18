Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :locations, only: [:index, :show]
  resources :ratings, only: [:create, :show, :update]
end
