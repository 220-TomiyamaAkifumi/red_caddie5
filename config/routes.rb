# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'
  resources :todos

  resources :user_sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
