# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/index'
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'products/index'
    get 'products/show'
    get 'products/new'
    get 'products/edit'
  end
  get 'products/index'
  get 'products/show'
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'
  resources :products, only: [:show]

  namespace :admin do
    resources :products
    resources :orders, only: %i[index show create]
  end

  resources :carts, only: [:index]

  resources :cart_items, only: %i[create destroy]
end
