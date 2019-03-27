Rails.application.routes.draw do
  root to: 'posts#index'
  mount Ckeditor::Engine => '/ckeditor'

  namespace :users do
    get 'omniauth_callbacks/google_oauth2'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
  resources :hashtags, only: [:show]
end
