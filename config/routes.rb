Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users, only: [] do
    collection do
      post :login
      post :register
    end
  end
  resources :locations, only: [:index, :show, :create]
  resources :ratings, only: [:create, :show, :update]
end
