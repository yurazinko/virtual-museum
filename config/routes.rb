Rails.application.routes.draw do
  namespace :admin do
    resources :users
    root to: "exhibits#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :exhibits
end
