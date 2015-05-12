Rails.application.routes.draw do
  root 'projects#index'
  resources :users, only: [:new, :create]
  resources :projects, only: [:new, :create, :update, :show, :destroy]
end
