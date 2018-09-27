Rails.application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" },
      skip: [:registrations, :passwords, :confirmations, :unlocks]
   

  require 'sidekiq/web'
  
  mount Sidekiq::Web => '/sidekiq'

  #  scope module: :api, path: 'api' do
  #    scope module: :v1 do
  #      devise_for :users, controllers: {
  #           sessions: 'api/v1/users/sessions',
  #       }, skip: [:registrations, :passwords, :confirmations, :unlocks]
  #    end
  #  end

  resources :users do
    member do 
      delete :delete_image_attachment
    end
    member do 
      get    :download_image_attachment
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
