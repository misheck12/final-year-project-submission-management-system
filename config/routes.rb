Rails.application.routes.draw do
  devise_for :users, skip: :all

  authenticated :user do
    root to: 'dashboards#index', as: :authenticated_root
  end

  root to: 'homes#index'

  resources :teams
  resources :tasks
  resources :projects
  resources :dashboards

  # Define your faculty routes here
  get 'faculty/index'
  get 'faculty/show'

  # Devise routes for users
# Devise routes for users
# Devise routes for users
#



  # Devise routes for admin users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
