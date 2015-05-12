Rails.application.routes.draw do

  resources :user_sessions
  resources :users, only: [:new, :create]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
