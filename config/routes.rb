Rails.application.routes.draw do
  root 'pages#home'

  # Mostly static pages
  get '/home' => 'pages#home'
  get '/map' => 'pages#map'
  get '/help' => 'pages#help'

  get '/signup' => 'users#new'
   # get '/users/:id/edit' => 'users#edit', :as => :user

  # resources :news

  # resources :tales

  # resources :events

  resources :users

  # resources :locations
end
