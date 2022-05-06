Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get 'alta_ruta', to: 'application#alta_ruta'
  # post 'alta_ruta', to ....

  get 'create_user', to: 'application#create_user' 
  
  resources :users
  # get 'sign_up', to: 'users#new'
  # get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new'
  # get 'users/:id', to: 'users#show'
  # post 'users', to:'users#create'
  # delete 'users/:id', to: 'users#destroy'
  
end
