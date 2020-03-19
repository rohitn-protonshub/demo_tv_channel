Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :channels, only: [:index]
  resources :channel_shows, only: [:index] 

  resources :users do 
    
    get :all_favourite_shows
    member do
      get :favourite_show
      delete :unfavourite_show
    end
  end
end
