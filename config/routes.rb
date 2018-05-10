Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'rents#index'

  require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'

  resources :rents do
    collection do
      get :chart
    end
  end


end
