Rails.application.routes.draw do
  devise_for :users
  root to: "dragons#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dragons, except: :index do
    resources :bookings, only: %i[create update]
  end
  resources :bookings, only: %i[index show destroy]

  get '/my-dragons', to: 'dragons#my_dragons'
  get '/my-bookings', to: 'dragons#my_bookings'
  get '/my-bookings-owner', to: 'dragons#my_bookings_owner'
end
