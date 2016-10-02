Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :locations, only: [:index, :show]
end
