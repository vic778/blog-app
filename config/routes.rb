# frozen_string_literal: true

Rails.application.routes.draw do
  resources :post
  # get 'post/index'
  # get 'post/new'
  # get 'post/show'
  # get 'post/create'

  get 'user/index'
  get 'user/new'
  get 'user/show'
  get 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
