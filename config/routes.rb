# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to sign in page if not signed in
  resources :urls, only: [:index, :new, :create, :edit, :update, :destroy]
  get "/:lookup_code", to: "urls#show"

  authenticated :user do
    root 'urls#index', as: :authenticated_root
  end

  root to: "welcome#index"
end
