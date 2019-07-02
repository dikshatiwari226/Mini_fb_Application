Rails.application.routes.draw do
 
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'
  devise_for :users
  get 'welcome/index'
  

  resources :posts do
  	resources :comments do
      resources :replies
    end
  end

  resources :likes

    
  root 'welcome#index'
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end
