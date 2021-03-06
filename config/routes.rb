Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users, only: [:show, :update]
  resources :ads, only: [:index]
  get 'ads/bar'
  get 'ads/shows'
  get 'ads/restaurante'
end
