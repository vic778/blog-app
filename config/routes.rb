# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts

  get 'user/index'
  get 'user/new'
  get 'user/show'
  get 'user/create'

  resources :users, only: [:index, :show, :create, :new] do
    resources :posts, only: [:index, :show, :create, :new]
  end

end
