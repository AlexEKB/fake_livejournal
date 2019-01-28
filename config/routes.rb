Rails.application.routes.draw do
  root to: "posts#index"

  namespace :users do
    get 'omniauth_callbacks/google_oauth2'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
