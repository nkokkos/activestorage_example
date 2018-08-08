Rails.application.routes.draw do
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'

  resources :users do
    member do 
      delete :delete_image_attachment
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
