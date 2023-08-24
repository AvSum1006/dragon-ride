Rails.application.routes.draw do
  devise_for :users
  root to: "dragons#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dragons, except: :index do
    resources :bookings, only: %i[new create update]
  end
  resources :bookings, only: %i[show destroy]
end
