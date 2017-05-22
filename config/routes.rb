Rails.application.routes.draw do
  root to: "links#index"

  get "/login", to: "sessions#new"
  get "/login", to: "sessions#create"
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
