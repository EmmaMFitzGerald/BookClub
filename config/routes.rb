Rails.application.routes.draw do

  get '/signup' => 'users#new' #creates custom route


  resources :comments
  resources :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
