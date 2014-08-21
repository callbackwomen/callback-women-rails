Rails.application.routes.draw do
  resources :conferences, only: [:index, :show, :new, :create] do
    resources :calls, only: [:new, :create]
  end

  root to: "conferences#index"

  get 'auth/twitter/callback', to: "sessions#create"
end
