Rails.application.routes.draw do
 
 root 'welcome#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'
  devise_for :users

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    
    resources :messages, only: [:create]
  end
  
  get 'welcome/index'
  

  resources :posts do
  	resources :comments do
      resources :replies
    end
  end

  resources :likes
  resources :friendships do
    member do
      get :send_request
      get :accept
      get :reject
    end
  end
  
    
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end




