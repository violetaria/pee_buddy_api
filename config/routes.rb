Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        resources :sessions, only: [:create]
        resources :locations, only: [:index, :create, :show] do
          get :nearby_places, on: :collection
          resources :ratings, only: [:create, :update, :show], on: :member
      end

    end
  end
end
