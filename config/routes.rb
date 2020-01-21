Rails.application.routes.draw do
  
  #created custom root route
  root 'sessions#home' 

  #search route
  get '/search' => 'books#search', :as => 'search_page' 

  #custome routes to sign up
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  #route to login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #omniauth callback route
  get '/auth/google_oauth2/callback' => 'sessions#google'

  #route to logout
  delete '/logout' => 'sessions#destroy'

  resources :books do
    resource :comments
  end 

  resources :comments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
