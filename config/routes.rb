Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "boards#index"

  resources :boards do
    resources :topics do
      resources :replies
    end
  end

  resources :topics do
    resources :replies
  end

  resources :articles do
    resources :comments
  end

  resources :users

  get "login", to: "sessions#login"
  post "login" => "sessions#create"
  post "logout" => "sessions#destroy"
  get "logout" => "sessions#destroy"
end
