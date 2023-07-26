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
devise_scope :user do
  get '/users/sign_in', to: 'devise/sessions#new', as: :new_user_session
  post '/users/sign_in', to: 'devise/sessions#create', as: :user_session
  delete '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

  get '/users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
  post '/users', to: 'devise/registrations#create', as: :user_registration
end


  # Devise routes for admin users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
