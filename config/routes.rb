Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_for :user_admins
  resources :users, only: [:index, :show, :create, :update, :destroy]
end
