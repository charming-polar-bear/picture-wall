Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  resources :users

  resources :account

  namespace :admin do
    resources :users
    resources :posts
  end

  root 'posts#index'
end