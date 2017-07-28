Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: 'omniauth_callback' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
    member do
      post :current_user_like
      post :current_user_dislike
    end

  end

  resources :users

  resources :account

  namespace :admin do
    resources :users do
      member do
        post :active
        post :disactive
        post :set
        post :remove
      end
    end
  end

  root 'posts#index'
end
