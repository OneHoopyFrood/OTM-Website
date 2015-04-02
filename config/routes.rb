Rails.application.routes.draw do
  root 'pages#home'
  
  get 'map' => 'pages#map'
  get 'help' => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  get 'myaccount' => 'users#myaccount'
  resources :users, except: [:index, :show] do
    resource :profile, only: [:show, :edit, :update]
  end

  resources :posts
  
  # resources :events
  # resources :locations
end
