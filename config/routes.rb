# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users


    root "users#index"

    get 'likes/create'
  get 'comments/create'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create]
    end
  end

end
