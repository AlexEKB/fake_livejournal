Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/google_oauth2'
  end
  root to: "users#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
end
