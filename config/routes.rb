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

  resources :books do
    resource :comments
  end 
  
  resources :comments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
