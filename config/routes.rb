# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items, only: [:new, :create, :update]
  resources :carts, only: [:new, :create, :update, :show]
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :categories
  resources :users, only: [:update]
end
