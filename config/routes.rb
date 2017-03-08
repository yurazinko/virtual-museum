Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :exhibits
  resources :groups
  resources :articles

  namespace :admin do
    resources :users
    resources :exhibits
    resources :groups
    resources :articles
  end

end
