Rails.application.routes.draw do
  root to: "users#index"

  namespace :users do
    get 'omniauth_callbacks/google_oauth2'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
end
