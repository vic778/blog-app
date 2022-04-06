# frozen_string_literal: true

Rails.application.routes.draw do

    root "users#index"

    resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :create, :new]
    end

end