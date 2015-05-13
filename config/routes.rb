Rails.application.routes.draw do
  get 'pledges/create'

  get 'pledges/new'

  resources :user_sessions
  resources :users, only: [:new, :create]

  resources :projects do
    resources :pledges
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  namespace :admin do
    resources :users
  end
end
