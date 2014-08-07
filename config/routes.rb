Rails.application.routes.draw do
  resources :conferences, only: :index do
    resources :calls, only: [:new, :create]
  end
end
