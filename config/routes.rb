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

  get '/my-dragons', to: 'dragons#my_dragons'
  get '/my-bookings', to: 'bookings#my_bookings'
  get '/my-bookings-owner', to: 'bookings#my_bookings_owner'
end
