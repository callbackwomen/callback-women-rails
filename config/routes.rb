Rails.application.routes.draw do
  resources :conferences, only: [:index, :show] do
    resources :calls, only: [:new, :create]
  end
end
