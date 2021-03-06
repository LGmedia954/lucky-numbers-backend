Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      resources :users do
        resources :rounds, only: [:new, :create, :index, :show, :destroy]
      end
      
      resources :rounds
      resources :users

    end
  end
end