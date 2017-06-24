# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos
  get 'home/index'

  root to: 'home#index'

  resources :user_sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
