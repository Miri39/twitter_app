Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'application#home'
  get 'alta_ruta', to: 'application#alta_ruta'
  # post 'alta_ruta', to ....

  get 'create_user', to: 'application#create_user' 
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources :comms 
  resources :replies
  resources :relationships, only: [:create, :destroy]
  post 'posts/:id/comm', to: 'comms#create'
  get 'posts/:id/:comm_id', to: 'replies#index'
  post 'posts/:id/:comm_id', to: 'replies#create'

  post 'users/:id', to: 'users#show'

  post 'toggle_like_p/:id', to: 'posts#toggle_like_p'
  post 'toggle_like_c/:id', to: 'comms#toggle_like_c'
  post 'toggle_like_r/:id', to: 'replies#toggle_like_r'
  # get 'sign_up', to: 'users#new'
  # get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new'
  # get 'users/:id', to: 'users#show'WSW
  # post 'users', to:'users#create'
  # delete 'users/:id', to: 'users#destroy'
  get 'admin/statistics', to: 'admin#index' 
  post 'toggleAdmin/:id', to: 'admin#toggleAdmin'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # get 'users/:id/following', to:'users#following'
  # get 'users/:id/followers', to:'users#followers'

end
