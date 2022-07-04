# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles do # Establishes all the usual routing for '@articles'
    resources :comments # Note how comments is nested, to signify the hierarchical relationship between articles and comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
end
