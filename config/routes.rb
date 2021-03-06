# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users


    root "users#index"

    get 'likes/create'
  get 'comments/create'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show ] do
        resources :posts, only: %i[index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end

end
