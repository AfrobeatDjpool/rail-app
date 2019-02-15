Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :users
  resources :songs
  get '/mysong', to: 'songs#mysong'
  # patch '/api/v1/songs/:id', to: 'songs#update'
  namespace :admin do
    resources :songs
  end
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
      get 'sessions/destroy'
    end
  end
  devise_for :users
  get'/profile/:id', :to => 'users#profile'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#index'
  root 'users#show'
  namespace :api do
	  namespace :v1 do
	  	resources :users, only: [:index] 
      post "/users", :to => 'users#index'

      post "/sign_in", :to => 'sessions#create'
      delete "/sign_out", :to => 'sessions#destroy'
      get "/profile", :to => 'registrations#profile'
      post "/profile", :to => 'registrations#profile'
      post "/sign_up", :to => 'registrations#create'
      post"/facebook_login", :to => 'sessions#facebook_login'
      post "/update_account", :to => 'registrations#update'
      get "/reset_password", :to => 'registrations#reset_password'
      post "/reset_password", :to => 'registrations#reset_password'
      resources :songs
      get '/mysongs', to: 'songs#mysongs'
      get '/download_section', to: 'songs#download_section'
	  end
	end

  # Admin dashboard
  namespace :admin do    
    resources :users do
    resources :songs
    end
    resources :analytics
  end
  apipie

  #Callback
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]

end
