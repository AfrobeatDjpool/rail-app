Rails.application.routes.draw do
  resources :rents
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'home#index'

  require 'sidekiq/web'

  # ...
  # mount Sidekiq::Web, at: '/sidekiq'
   # authenticate :user, lambda { |u| u.is_admin? } do
    # mount Sidekiq::Web => '/sidekiq'
    mount Sidekiq::Web, at: '/sidekiq'

  # end 
end
