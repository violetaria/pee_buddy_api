Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        resources :sessions, only: [:create]
        resources :locations, only: [:index, :create] do
          get :nearby_places, on: :collection
        end
        resources :ratings, only: [:create, :update, :show]
    end
  end
end
