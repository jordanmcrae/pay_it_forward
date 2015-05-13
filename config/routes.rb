Rails.application.routes.draw do

  root 'projects#index'
  resources :user_sessions
  resources :users, only: [:new, :create]
  resources :projects, only: [:new, :create, :update, :show, :destroy] do
    resources :pledges, only: [:new, :create]
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  namespace :admin do
    resources :users
  end
end

