# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :todos
  get 'home/index'

  root to: 'home#index'

  get 'sign_in' => 'user_sessions#new', as: :sign_in
  post 'sign_out' => 'user_sessions#destroy', as: :sign_out
  resources :user_sessions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
