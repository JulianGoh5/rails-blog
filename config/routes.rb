# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles # Establishes all the usual routing for '@articles'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
end
