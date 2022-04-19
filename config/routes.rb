# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users


    root "users#index"

    resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :create, :new]
    end

    resources :posts do
      resources :comments, only: %i[create destroy]
        resources :likes, only: %i[create]
  end

end
