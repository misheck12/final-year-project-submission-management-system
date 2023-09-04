Rails.application.routes.draw do
  devise_for :users

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

  # Devise routes
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Move user resources outside of the dashboards resources block
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
