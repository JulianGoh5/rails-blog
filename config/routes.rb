# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index' # Tells Rails to map requests to http://localhost:3000/welcome/index -> pointing to the literal file in directory
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # A resource - term used for a collection of similar objects (execute create, read, update and destroy). THe "resources" method declares a standard REST resource
  resources :articles do # Establishes all the usual routing for '@articles'. 
    resources :comments # Note how comments is nested, to signify the hierarchical relationship between articles and comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index' # Tells Rails to map requests to the root of the application to the welcome controller's index action
end
