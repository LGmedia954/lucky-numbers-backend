Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/api/v1/instructions", to: "api/v1/static#instructions"

  namespace :api do
    namespace :v1 do

      resources :users do
        resources :rounds, only: [:index, :show, :create, :destroy]
      end

    end
  end
end