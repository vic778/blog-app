# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :new] do
    resources :posts, only: [:index, :show, :create, :new]
  end

end
