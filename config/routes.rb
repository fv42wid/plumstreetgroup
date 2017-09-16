Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'pages#home'

  resources :messages, only: [:create]
  resources :invoices, only: [:show, :create]
  resources :charges, only: [:show]

  root 'pages#home'
end
