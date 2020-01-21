Rails.application.routes.draw do
  
  root 'sessions#home' #created root route

  #route to sign up
  get '/signup' => 'users#new' #creates custom route
  post '/signup' => 'users#create'
  
  #route to login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #route to logout
  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :users do 
    resources :books, only: [:new, :create, :index]
  end 
  resources :books do
    resource :comments, only: [:new, :create, :index]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
